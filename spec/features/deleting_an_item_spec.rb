require 'rails_helper'

RSpec.describe 'Deleting an Item', type: :feature do

  let(:admin) { create(:admin) }
  let(:product) { create(:product, :with_image) }

  it 'successfully deletes a menu item' do

    sign_in admin
    visit product_path(product)

    expect(page).to have_link("Delete Item")
    expect { click_link "Delete Item" }.to change{ Product.count }.by(-1)
    expect(page).to have_text("Menu item deleted")
    expect(page).to have_text("All Current Menu Items")

  end

end
