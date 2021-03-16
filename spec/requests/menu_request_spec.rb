require 'rails_helper'

RSpec.describe "Menu", type: :request do

  describe "GET /menu" do
    it "returns http success" do
      get "/menu"
      expect(response).to have_http_status(:success)
      expect(response).to render_template('shared/_nav')
    end
  end

  describe "GET /search" do
    it 'returns success upon filtering results' do
      get '/menu'
      expect(response).to have_http_status(:success)
    end
  end

end
