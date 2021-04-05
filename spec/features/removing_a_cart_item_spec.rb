require 'rails_helper'

RSpec.describe 'Removing a cart item', type: :feature do

  let!(:cart) { create(:cart_with_an_item) }

  it 'removes a cart item' do
    visit menu_path
    page.refresh
    click_link "My Cart"
    expect(page).to have_link("Remove Item")
    expect { click_link("Remove item") }.to change { cart.line_items.count }.by(-1)
    expect(page).to have_text("Item removed")
  end
end
