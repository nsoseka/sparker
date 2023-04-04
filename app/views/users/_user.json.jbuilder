json.extract! user, :id, :first_name, :last_name, :maiden_name, :age, :gender, :email, :phone, :username, :password, :birth_date, :image, :blood_group, :height, :weight, :eye_color, :domain, :ip, :mac_address, :university, :ein, :ssn, :user_agent, :created_at, :updated_at
json.url user_url(user, format: :json)
