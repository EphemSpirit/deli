require 'rails_helper'

RSpec.describe 'Editing a Menu Item', type: :feature do

  let(:admin) { create(:admin) }
  let(:item) { create(:product, :with_image) }

  it 'successfully updates a manu item and redirects' do
    sign_in admin
    visit edit_product_path(item)

    #click an item
    expect(page).to have_text("Editing: #{item.name}")

    #make sure item fields are there
    expect(page).to have_text(item.name)
    expect(page).to have_text(item.description)
    expect(page).to have_field("Vegan")
    expect(page).to have_field("Vegetarian") #and so on

    #change something
    fill_in "Name", with: "Spaghett"
    find('input[name="commit"]').click
    expect(page).to have_content("Menu item updated!")
    expect(page).to have_text("Spaghett")
  end
end
