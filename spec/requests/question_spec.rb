require "rails_helper"

feature "question" do
  it "allows user to create a new question" do
    visit "/questions/new"

    fill_in "Title",                 :with => "Sample test question"
    fill_in "Body",              :with => "Sample body"
    fill_in "Tags",              :with => "newTag"

    click_button "Create Question"

    expect(page).to have_content("Sample test question")
  end

end