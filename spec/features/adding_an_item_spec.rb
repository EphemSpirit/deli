require 'rails_helper'

RSpec.describe 'Adding a Menu Item', type: :feature do

  let(:admin) { create(:admin) }

  it 'adds a menu item and redirects to products index' do
    #not signed in, test redirect
    sign_in admin
    visit products_path
    expect(page).to have_link("New Item", href: new_product_path)

    #button puts me in the right place
    click_button "New Item"
    expect(page).to have_text("Add a Menu Item")

    #fill out the new item form and submit it
    fill_in "Name", with: "Test Item"
    fill_in "Price", with: "21"
    fill_in "Description", with: "This is a test item"
    select("True", from: "Vegetarian")
    select("False", from: "Vegan")
    select("True", from: "Nut Free")
    select("False", from: "Dairy Free")
    select("True", from: "Available")
    attach_file "product_image", 'spec/support/assets/canoli.jpg'
    click_button "Attach File"
    expect { click_button "Add Item" }.to change { Product.count }.by(1).and redirect_to(products_path)
  end
end
