require 'rails_helper'

RSpec.describe "StaticPages", type: :request do

  describe "GET /" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
      expect(response).to render_template('shared/_nav')
      expect(response).to render_template('home')
    end
  end

  describe 'GET /about' do
    it "returns http success" do
      get "/about"
      expect(response).to have_http_status(:success)
      expect(response).to render_template('shared/_nav')
      expect(response).to render_template('about')
    end
  end

  describe 'GET /contact' do
    it "returns http success" do
      get "/contact"
      expect(response).to have_http_status(:success)
      expect(response).to render_template('shared/_nav')
      expect(response).to render_template('contact')
    end
  end

end
