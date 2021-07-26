require 'rails_helper'

RSpec.describe 'Removing a cart item', type: :feature do

  let!(:cart) { create(:cart_with_an_item) }

  it 'removes a cart item' do
    visit menu_path
    expect(page).to have_selector(".btn-primary")
    click_button(".btn-primary", match: :first)
    expect(page).to have_content("Item added to cart!")

    #Remove the item and verify path/flash message
    click_link "Remove"
    expect(current_path).to eq("/carts/#{cart.id}")

  end
end
