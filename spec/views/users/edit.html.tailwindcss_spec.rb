require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  let(:user) {
    User.create!(
      first_name: "MyString",
      last_name: "MyString",
      maiden_name: "MyString",
      age: 1,
      gender: "MyString",
      email: "MyString",
      phone: "MyString",
      username: "MyString",
      password: "MyString",
      birth_date: "MyString",
      image: "MyString",
      blood_group: "MyString",
      height: "MyString",
      weight: "MyString",
      eye_color: "MyString",
      domain: "MyString",
      ip: "MyString",
      mac_address: "MyString",
      university: "MyString",
      ein: "MyString",
      ssn: "MyString",
      user_agent: "MyString"
    )
  }

  before(:each) do
    assign(:user, user)
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(user), "post" do

      assert_select "input[name=?]", "user[first_name]"

      assert_select "input[name=?]", "user[last_name]"

      assert_select "input[name=?]", "user[maiden_name]"

      assert_select "input[name=?]", "user[age]"

      assert_select "input[name=?]", "user[gender]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[phone]"

      assert_select "input[name=?]", "user[username]"

      assert_select "input[name=?]", "user[password]"

      assert_select "input[name=?]", "user[birth_date]"

      assert_select "input[name=?]", "user[image]"

      assert_select "input[name=?]", "user[blood_group]"

      assert_select "input[name=?]", "user[height]"

      assert_select "input[name=?]", "user[weight]"

      assert_select "input[name=?]", "user[eye_color]"

      assert_select "input[name=?]", "user[domain]"

      assert_select "input[name=?]", "user[ip]"

      assert_select "input[name=?]", "user[mac_address]"

      assert_select "input[name=?]", "user[university]"

      assert_select "input[name=?]", "user[ein]"

      assert_select "input[name=?]", "user[ssn]"

      assert_select "input[name=?]", "user[user_agent]"
    end
  end
end
