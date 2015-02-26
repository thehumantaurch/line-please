require 'spec_helper.rb'

feature "Creating, editing, and deleting a script", js: true do
  before :each do
    Script.destroy_all
  end
  scenario "CRUD a script" do
    visit '/'
    click_on "New Script"

    fill_in "title", with: "As You Like It"
    fill_in "author", with: "William Shakespeare"

    click_on "Save"

    expect(page).to have_content("As You")
    expect(page).to have_content("William")

    click_on "Edit"

    fill_in "title", with: "Hamlet"
    fill_in "author", with: "William Shakespeare"

    click_on "Save"

    expect(page).to have_content("Hamlet")
    expect(page).to have_content("Shakespeare")

    visit "/"
    fill_in "keywords", with: "Ham"
    click_on "Search"

    click_on "Hamlet"

    click_on "Delete"
    sleep 1

    expect(Script.find_by(title: "Hamlet")).to be_nil

  end
end