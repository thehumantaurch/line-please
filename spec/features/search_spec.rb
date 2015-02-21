require 'spec_helper.rb'

feature "Looking up scripts", js: true do
  scenario "finding scripts" do
    visit '/'
    fill_in "keywords", with: "hamlet"
    click_on "Search"

    expect(page).to have_content("Hamlet")
  end
end