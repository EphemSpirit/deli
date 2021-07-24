require 'rails_helper'

RSpec.describe 'Deleting an Item', type: :feature do

  let(:admin) { create(:admin_user) }

  it 'successfully deletes a menu item' do

    visit new_admin_user_session_path
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Login"
    expect(current_path).to eq('/admin')

  end

end
