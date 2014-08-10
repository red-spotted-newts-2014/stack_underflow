require "rails_helper"

feature "user registration" do
  it "allows new users to register with an email address and password" do
    visit "/users/sign_up"

    fill_in "Email",                 :with => "rootul@test.com"
    fill_in "Password",              :with => "password100"

    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end