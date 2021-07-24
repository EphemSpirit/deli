require 'rails_helper'

RSpec.describe 'Deleting an Item', type: :feature do

  let(:admin) { create(:admin_user) }

  it 'successfully deletes a menu item' do

    visit new_admin_user_session_path
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Login"
    expect(current_path).to eq('/admin')
    click_link "Products"

    click_link "New Product"
    fill_in "Name", with: "Short lived product"
    fill_in "Price", with: "12.99"
    fill_in "Description", with: "This will die soon"
    check "Dairy free"
    check "Nut free"
    check "Available"
    click_button "Create Product"
    expect(page).to have_content "Product was successfully created"

    #Now delete it
    click_link "Delete Product"
    expect(page).to have_content "Product was successfully destroyed"

  end

end
