require 'rails_helper'

describe 'the menu view' do

  it 'filters the menu based on checkboxes' do
    visit menu_path
    expect(page).to have_selector('form')
    expect(page).to have_selector('input#term')
    fill_in 'Term', with: "Pasta"
    click_button "Search"
    expect(page).to have_select('.card'), count: 10
  end



end
