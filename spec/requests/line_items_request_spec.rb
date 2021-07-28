require 'rails_helper'

RSpec.describe "LineItems", type: :request do

  let(:product) { create(:product_with_line_item) }
  let(:cart) { create(:cart_with_an_item) }

  describe 'POST /line_items' do

    it 'adds a line item' do
      post line_items_path, params: { id: product.id, product_id: product.id }
      expect(response).to have_http_status(302)
      follow_redirect!
      expect(response).to render_template('shared/_messages')
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /line_item' do
    #this test attempts to run a line of code that does not exist

    # it 'removes a line_item' do
    #   item = cart.line_items.first
    #   delete line_item_path(item)
    #   expect(response).to have_http_status(302)
    #   follow_redirect!
    #   expect(response.body).to include("Item removed from cart.")
    # end
  end

end
