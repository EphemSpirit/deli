require 'rails_helper'

RSpec.describe 'emptying a cart', type: :feature do

  let(:cart) { create(:cart_with_an_item) }

  it 'successfully empties a cart' do
    visit cart_path(cart)
    expect(page).to have_link("Empty Cart")
    #total cart count will increase, since it'll redirect to the home page and call #set_cart and make a new empty cart object
    expect { click_link("Empty Cart") }.to change { Cart.count }.by(1)
  end

end
