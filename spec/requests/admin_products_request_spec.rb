require 'rails_helper'

RSpec.describe "Admin Products", type: :request do

  let!(:user) { create(:admin_user) }
  let(:item) { create(:product) }

  context "not logged in" do
    it "redirects a non logged in user" do
      get admin_products_path
      expect(response).to have_http_status(302)
    end
  end

  context "logging in with invalid info" do

    it "re-renders when wrong password" do
      post admin_user_session_path, params: { email: user.email, password: "wrong_password" }
      expect(response.body).to include("Invalid Email or password")
    end
  end

  context "logging in with correct info" do
    it "success when valid info" do
      post admin_user_session_path, params: { email: user.email, password: user.password }
      expect(response).to have_http_status(200)
    end
  end

end
