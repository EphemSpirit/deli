require 'rails_helper'

RSpec.describe "Adding an item to a cart", type: :feature do

  let(:product) { create(:product) }

  it 'successfully adds an item' do
    visit menu_path
    first(:input, "Add to Cart").click
    expect(page).to have_text("Item added to cart!")
  end

end
