require 'rails_helper'

RSpec.describe "Adding an item to a cart", type: :feature do

  let(:cart) { create(:cart_with_an_item) }

  it 'successfully adds an item' do
    visit menu_path
    expect(current_path).to eq('/menu')
    expect(page).to render_template('_all_items')
    # expect(page).to have_selector(".btn-primary")
    find("input[value='Add to Cart']").click
    expect(current_path).to eq('/carts/#{cart.id}')
    expect(page).to have_content("Item added to cart!")
    expect(page).to have_selector("td .product-price")
  end

end
