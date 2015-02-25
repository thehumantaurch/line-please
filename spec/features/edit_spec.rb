require 'spec_helper.rb'

feature "Creating, editing, and deleting a script", js: true do
  scenario "CRUD a script" do
    visit '/'
    click_on "New Script"

    fill_in "title", with: "She Kills Monsters"
    fill_in "author", with: "Qui Nguyen"

    click_on "Save"

    expect(page).to have_content("Monsters")
    expect(page).to have_content("Qui")

    click_on "Edit"

    fill_in "title", with: "She Eats Monsters"
    fill_in "author", with: "Sarah Taurchini"

    click_on "Save"

    expect(page).to have_content("Eats Monsters")
    expect(page).to have_content("Sarah")

    visit "/"

    fill_in "keywords", with: "She"
    click_on "Search"

    click_on "She Eats Monsters"

    click_on "Delete"

    expect(Script.find_by_name("She Kills Monsters")).to be_nil

  end
end