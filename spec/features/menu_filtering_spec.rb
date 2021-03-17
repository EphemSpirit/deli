require 'rails_helper'

describe 'the menu view' do

  it 'filters the menu based on search terms' do
    visit menu_path
    expect(page).to have_selector('form')
    expect(page).to have_selector('input#term')
    fill_in 'Term', with: "Pasta"
    click_button "Search"
    expect(page).to have_content('Results')
  end

  it 'filters the menu based on filter options' do
    visit menu_path
    expect(page).to have_selector('select')
    find('#filter').find(:xpath, 'option[2]').select_option
    click_button 'Search'
    expect(page).to have_content('Results')
    #heavily coupled to how I seeded the dev db - should probably fix this
    expect(page).to have_selector('.card'), count: 10
  end



end
