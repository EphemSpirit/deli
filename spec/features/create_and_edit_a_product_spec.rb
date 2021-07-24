require 'rails_helper'

RSpec.describe "Editing a menu item", type: :feature do

  let(:admin) { create(:admin_user) }

  it "should create an item" do

    #login as an admin
    visit new_admin_user_session_path
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Login"

    #verify I'm on the products page and click the first item's edit button
    expect(current_path).to eq('/admin')
    click_link "Products"
    expect(current_path).to eq('/admin/products')
    expect(page).to have_content("Products")

    #add a new product
    click_link "New Product"
    expect(current_path).to eq('/admin/products/new')
    fill_in "Name", with: "New Product"
    fill_in "Price", with: "24.99"
    fill_in "Description", with: "This is a new product, limited time only"
    check "Vegan"
    check "Available"
    click_button "Create Product"
    expect(page).to have_content "Product was successfully created"

    #Edit that product
    expect(page).to have_content "Edit Product"
    click_link "Edit Product"
    expect(page).to have_content "Edit Product"
    check "Nut free"
    click_button "Update Product"
    expect(page).to have_content "Product was successfully updated"

  end

end
