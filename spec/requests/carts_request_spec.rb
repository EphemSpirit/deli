require 'rails_helper'

RSpec.describe "Carts", type: :request do

  let(:cart) { create(:cart) }

  describe 'GET /cart' do

    before(:example) { get cart_path(cart) }

    it 'is successful' do
      expect(response).to have_http_status(200)
      expect(response).to render_template('_cart_items')
    end

  end

  describe 'DELETE /cart' do

    it 'successfully destroys a cart' do
      delete cart_path(cart)
      expect(response).to have_http_status(302)
    end

  end

end
