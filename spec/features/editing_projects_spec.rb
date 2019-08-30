require "rails_helper"

RSpec.feature "Users can edit existing projects" do


  before do
    FactoryGirl.create(:project, name: "Sublime Text 3")

    visit "/"
    click_link "Sublime Text 3"
    click_link "Edit Project"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Sublime Text 4 beta"
    fill_in "Description", with: "A text editor for everyone"
    click_button "Update Project"

    expect(page).to have_content "Project has been updated."
    #expect(page).to have_content "Sublime Text 4 beta"
  end

  scenario "when providing invalid attributes" do
    click_button "Update Project"

    expect(page).to have_content "Project has not been updated."
    expect(page).to have_content "Description can't be blank"
  end


end