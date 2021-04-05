require 'rails_helper'

RSpec.describe "Adding an item to a cart", type: :feature do

  let(:product) { create(:product) }
  let(:cart) { create(:cart) }

  it 'successfully adds an item' do
    visit menu_path
    button = find('input[value="Add to Cart"]', visible: false).first
    expect { button.click }.to change { cart.line_items.count }.by(1)
    expect(page).to have_text("Item added to cart!")
  end

end
