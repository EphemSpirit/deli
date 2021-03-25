require 'rails_helper'

RSpec.describe 'Editing a Menu Item', type: :feature do

  let(:admin) { create(:admin) }

  it 'successfully updates a manu item and redirects' do
    sign_in admin
    visit products_path

    #click an item
    item = Product.first
    click_link "Poutine"
    expect(page).to have_text("Editing: #{item.name}")

    #make sure item fields are there
    expect(page).to have_text(item.name)
    expect(page).to have_text(item.description)
    expect(page).to have_text(item.vegan)
    expect(page).to have_text(item.vegetarian) #and so on

    #change something
    fill_in "Description", with: "I've decided I don't like poutine"
    expect { click_button "Update Item" }.to have_http_status(:success).and redirect_to(products_path)
  end
end
