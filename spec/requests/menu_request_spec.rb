require 'rails_helper'

RSpec.describe "Menu", type: :request do

  describe "GET /menu" do

    before(:example) { get menu_path }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'correctly assigns products' do
      expect(assigns(:products)).to eq(Product.all)
    end

    it 'renders expected templates' do
      expect(response).to render_template('shared/_nav')
      expect(response).to render_template('_all_items')
    end
  end

  describe "GET /search" do
    let(:product) { create(:product) }

    it 'correctly successfully executes a search' do
      get search_path, xhr: true, params: { "term" => "sta",
                                            "filter" => "--Filter--" }
      expect(response).to have_http_status(:success)
    end

    #find otu why broke
    it 'correctly assigns @results' do
      get search_path, xhr: true, params: { "term" => "sta",
                                            "filter" => "--Filter--" }
      expect(assigns(:results)).not_to be_nil
      expect(assigns(:results)).to include(product)
    end

  end

end
