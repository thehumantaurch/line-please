require 'spec_helper.rb'

feature "Viewing a script", js: true do
  before do
    Script.create(title: 'Hamlet',
           author: "William Shakespeare")

    Script.create(title: 'Much Ado About Nothing',
           author: 'Billy Shakes')
  end
  scenario "view one script" do
    visit '/'
    fill_in "keywords", with: "much"
    click_on "Search"

    click_on "Much Ado About Nothing"

    expect(page).to have_content("Much Ado")
    expect(page).to have_content("Shakes")

    click_on "Back"

    expect(page).to     have_content("About Nothing")
    expect(page).to_not have_content("Billy")
  end
end