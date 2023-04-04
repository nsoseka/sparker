class FetchUsersJob < ApplicationJob
  queue_as :default

  def perform(skip)
    # Do something later
    response = Faraday.get("https://dummyjson.com/users?limit=10&skip=#{skip}")

    JSON.parse(response.body)["users"].each do |usr|
      user = Parser::JsonParser.convert_hash_keys(usr)
      user[:birth_date] = user[:birth_date].to_date

      hair = user[:hair]
      hair[:hair_type] = hair[:type]
      hair = Parser::JsonParser.remove_recursively(hair, :type)

      address = user[:address]
      user_address_coordinate = address[:coordinates]
      address = Parser::JsonParser.remove_recursively(address, :coordinates)

      company = user[:company]
      company_address = company[:address]
      c_address = company[:address][:address]
      company_address_coordinate = company[:address][:coordinates]
      company_address = Parser::JsonParser.remove_recursively(company_address, :coordinates)
      company = Parser::JsonParser.remove_recursively(company, :address)

      bank = user[:bank]
      month, year = bank[:card_expire].split('/')
      year = Date.today.year.to_s.first(2) + year
      bank[:card_expire] = Date.new(year.to_i, month.to_i, -1)

      cleaned_user = Parser::JsonParser.remove_recursively(user, :id, :hair, :address, :company, :bank)

      User.find_or_initialize_by(email: cleaned_user[:email]).tap do |u|
        if u.new_record?
          u = User.new(cleaned_user)
        else
          hair[:id] = u.hair&.id
          bank[:id] = u.bank&.id
          address[:id] = u.address&.id
          user_address_coordinate[:id] = u.address&.coordinate&.id
          company[:id] = u.company&.id
          company_address[:id] = u.company&.address&.id
          company_address_coordinate[:id] = u.company&.address&.coordinate&.id
        end

        address[:coordinate_attributes] = user_address_coordinate
        company_address[:coordinate_attributes] = company_address_coordinate
        company_address[:address] = c_address
        company[:address_attributes] = company_address

        u.update_attribute(:hair_attributes, hair)
        u.update_attribute(:bank_attributes, bank)
        u.update_attribute(:address_attributes, address)
        u.update_attribute(:company_attributes, company)
        u.save
      end
    end
  end
end
