require 'rails_helper'

RSpec.describe 'emptying a cart', type: :feature do

  let(:cart) { create(:cart) }

  it 'successfully empties a cart' do
    visit cart_path(cart)
    expect(page).to have_selector('.product-card'), count: 1
    expect(page).to have_link("Empty Cart")
    expect { click_link("Empty Cart") }.to change { Cart.count }.by(-1).and redirect_to(menu_path)
    follow_redirect!
    expect(page).to have_text("You have emptied your cart")
  end

end
