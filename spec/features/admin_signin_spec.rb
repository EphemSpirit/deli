require 'rails_helper'

RSpec.describe "Admin Login", type: :feature do

  let(:admin) { create(:admin_user) }

  context "invalid ogin info" do
    it "redirects to login page with invalid info" do

      visit new_admin_user_session_path
      fill_in "Email", with: admin.email
      fill_in "Password", with: "wrong_password"
      click_button "Login"
      expect(current_path).to eq('/admin/login')

      fill_in "Email", with: "wrong@email.com"
      fill_in "Password", with: admin.password
      click_button "Login"
      expect(current_path).to eq('/admin/login')

      fill_in "Email", with: admin.email
      fill_in "Password", with: admin.password
      click_button "Login"
      expect(current_path).to eq('/admin')
      expect(page).to have_content("Logout")
      
    end
  end
end
