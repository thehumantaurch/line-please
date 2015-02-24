require 'spec_helper.rb'

feature "Viewing a script", js: true do
  before do
    Script.create!(title: 'Hamlet', author: 'William Shakespeare')
    Script.create!(title: "As You Like It", author: "William Shakespeare")
  end

  scenario 'view one script' do
    visit '/'
    fill_in "keywords", with: "Ham"
    click_on "Search"

    click_on "Hamlet"

    expect(page).to have_content("Hamlet")
    expect(page).to have_content("William")

    click_on "Back"

    expect(page).to have_content("Hamlet")
    expect(page).to_not have_content("William Shakespeare")
  end
end