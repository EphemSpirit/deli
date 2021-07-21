require 'rails_helper'

RSpec.describe "Admin Products", type: :request do

  context "not logged in" do
    it "redirects a non logged in user" do
      get admin_products_path
      expect(response).to have_http_status(302)
    end
  end

  context "logging in with invalid info" do
    let(:user) { create(:admin_user) }

    it "re-renders when wrong password" do
      post admin_user_session_path, params: { email: user.email, password: "wrong_password" }
      expect(current_path).to eq(new_admin_session_path)
    end
  end
end
