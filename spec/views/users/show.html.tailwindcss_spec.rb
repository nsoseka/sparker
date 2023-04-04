require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    assign(:user, User.create!(
      first_name: "First Name",
      last_name: "Last Name",
      maiden_name: "Maiden Name",
      age: 2,
      gender: "Gender",
      email: "Email",
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Maiden Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Birth Date/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Blood Group/)
    expect(rendered).to match(/Height/)
    expect(rendered).to match(/Weight/)
    expect(rendered).to match(/Eye Color/)
    expect(rendered).to match(/Domain/)
    expect(rendered).to match(/Ip/)
    expect(rendered).to match(/Mac Address/)
    expect(rendered).to match(/University/)
    expect(rendered).to match(/Ein/)
    expect(rendered).to match(/Ssn/)
    expect(rendered).to match(/User Agent/)
  end
end
