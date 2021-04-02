require 'rails_helper'

RSpec.describe "LineItems", type: :request do

  let(:product) { create(:product_with_line_item) }

  describe 'POST /line_items' do

    it 'adds a line item' do
      post line_items_path, params: { id: product.id, product_id: product.id }
      expect(response).to have_http_status(302)
      follow_redirect!
      expect(response.body).to have_text("Item added to cart")
    end
  end

  describe 'DELETE /line_item' do

    it 'removes a line_item' do
      item = product.line_items.first
      params = { id: item.id, product_id: item.id  }
      delete line_item_path(params)
      expect(response).to have_http_status(302)
      follow_redirect!
      expect(response.body).to include("Item removed from cart.")
    end
  end

end
