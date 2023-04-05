require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    @q = User.ransack(params[:q])
    @skip = 10
    assign(:users, [
      User.create!(
        first_name: "First Name",
        last_name: "Last Name",
        maiden_name: "Maiden Name",
        age: 2,
        gender: "Gender",
        email: "Email1",
        phone: "Phone",
        username: "Username",
        password: "Password",
        birth_date: "Birth Date",
        image: "Image",
        blood_group: "Blood Group",
        height: "Height",
        weight: "Weight",
        eye_color: "Eye Color",
        domain: "Domain",
        ip: "Ip",
        mac_address: "Mac Address",
        university: "University",
        ein: "Ein",
        ssn: "Ssn",
        user_agent: "User Agent"
      ),
      User.create!(
        first_name: "First Name",
        last_name: "Last Name",
        maiden_name: "Maiden Name",
        age: 2,
        gender: "Gender",
        email: "Email2",
        phone: "Phone",
        username: "Username",
        password: "Password",
        birth_date: "Birth Date",
        image: "Image",
        blood_group: "Blood Group",
        height: "Height",
        weight: "Weight",
        eye_color: "Eye Color",
        domain: "Domain",
        ip: "Ip",
        mac_address: "Mac Address",
        university: "University",
        ein: "Ein",
        ssn: "Ssn",
        user_agent: "User Agent"
      )
    ])
  end

  it "renders a list of users" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'tr>td' : 'div>p'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 3
    assert_select cell_selector, text: Regexp.new("Gender".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Phone".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Username".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Password".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Blood Group".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Height".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Weight".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Eye Color".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Domain".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Ip".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Mac Address".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("University".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Ein".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Ssn".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("User Agent".to_s), count: 2
  end
end
