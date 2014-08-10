require "rails_helper"

feature "user registration" do
  it "allows new users to register with an email address and password" do
    visit "/users/sign_up"

    fill_in "Email",                 :with => "rootul@test.com"
    fill_in "Password",              :with => "password100"

    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  it "allows existing user to sign in" do
    user = User.create(:email    => "rootul@test.com",
                                :password => "password100")

    visit "/users/sign_in"

    fill_in "Email",    :with => "rootul@test.com"
    fill_in "Password", :with => "password100"

    click_button "Sign in"

    expect(page).to have_content("Signed in successfully.")

  end

end