require 'rails_helper'

RSpec.describe "Menu", type: :request do

  describe "GET /menu" do

    before(:each) { get menu_path }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'correctly assigns products' do
      expect(assigns(:products)).to eq(Product.all)
    end

    it 'renders expected templates' do
      expect(response).to render_template('shared/_nav')
      expect(response).to render_template('_all_items')
      expect(response).not_to render_template('_results')
    end

  end

  describe "GET /search" do

    let!(:product) { create(:product, :with_image) }

    it 'correctly successfully executes a search' do
      get search_path, xhr: true, params: { "search" => { "term" => "sta",
                                                          "filter" => "--Filter--" } }
      expect(response).to have_http_status(:success)
    end

    #find otu why broke
    it 'correctly assigns @results' do
      #product = FactoryBot.create(:product)
      # Product.all << FactoryBot.create(:product)
      get search_path, xhr: true, params: { "search" => { "term" => "sta",
                                                          "filter" => "--Filter--" } }
      # new_product = create(:product)
      expect(assigns(:results)).not_to be_nil
      expect(assigns(:results)).to include(product)
    end

    it 'correctly filters items (filter is false)' do
      get search_path, xhr: true, params: { "search" => { "term" => "",
                                                          "filter" => "Vegan" } }
      expect(assigns(:results)).not_to include(product)
    end

    it 'correctly filters items (filter is true)' do
      get search_path, xhr: true, params: { "search" => { "term" => "",
                                                          "filter" => "Vegetarian" } }
      expect(assigns(:results)).to include(product)
    end

  end

end
