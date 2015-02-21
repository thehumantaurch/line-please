require 'spec_helper.rb'

feature "Looking up scripts", js: true do
  before do
    Script.create(title: "Hamlet", author: "William Shakespeare")
    Script.create(title: "Neverwhere", author: "Neil Gaiman")
    Script.create(title: "Very Still & Hard To See", author: "Steve Yockey")
    Script.create(title: "As You Like It", author: "William Shakespeare")
  end
  scenario "finding scripts" do
    visit '/'
    fill_in "keywords", with: "hamlet"
    click_on "Search"

    expect(page).to have_content("Hamlet")
  end
end