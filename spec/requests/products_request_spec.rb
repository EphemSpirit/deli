require 'rails_helper'

RSpec.describe "Products", type: :request do

  let(:admin) { create(:admin) }

  describe 'GET /products' do

    # before(:example) { get my_dishes_path }

    context 'not logged in' do

      it 'redirects to login when not signed in' do
        get products_path
        expect(response).to redirect_to(admin_session_path)
      end

      it 'is successful when logged in' do
        sign_in admin
        get products_path
        expect(response).to have_http_status(:success)
      end

    end

    context 'when logged in' do

      it 'renders all products' do
        sign_in admin
        get products_path
        expect(response).to have_http_status(:success)
        expect(assigns(:products)).to eq(Product.all.order(:id))
      end

      it 'renders unique templates' do
        sign_in admin
        get products_path
        expect(response).to render_template('_admin_nav')
      end

    end

  end

  describe 'GET /product/new' do

    context 'when logged in' do

      it 'is successful' do
        sign_in admin
        get new_product_path
        expect(response).to have_http_status(:success)
      end

      it 'renders the form' do
        sign_in admin
        get new_product_path
        expect(response).to render_template('_form')
      end

    end

  end

  describe 'GET /product/:id' do

    before(:example) do
      @item = create(:product, :with_image)
    end

    it 'renders successfully' do
      sign_in admin
      get product_path(@item)
      expect(response).to have_http_status(:success)
    end

    it 'correctly assigns @product' do
      sign_in admin
      get product_path(@item)
      expect(assigns(:product)).to eq(@item)
    end

    it 'displays the item card' do
      sign_in admin
      get product_path(@item)
      expect(response.body).to include(@item.name)
      expect(response.body).to include(@item.description)
    end
  end

  describe 'POST /products/new' do

    # sign_in admin
    let!(:new_item) { create(:product, :with_image) }

    it 'will successfuly create a new dish' do

      sign_in admin

      get new_product_path

      post products_path, params: { product: { name: new_item.name,
                                               price: new_item.price,
                                               description: new_item.description,
                                               vegan: new_item.vegan,
                                               vegetarian: new_item.vegetarian,
                                               nut_free: new_item.nut_free,
                                               dairy_free: new_item.dairy_free,
                                               available: new_item.available } }

      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /edit_dish' do

    # sign_in admin
    let!(:item) { create(:product, :with_image) }

    # before(:example) do
    #   get edit_product_path(item.id)
    # end

    it 'renders the form' do
      sign_in admin
      get edit_product_path(item.id)
      expect(response).to render_template('_form')
    end

    it 'successfully updates an item' do
      sign_in admin
      item.available = false

      patch product_path(item.id), params: { product: { name: item.name,
                                               price: item.price,
                                               description: item.description,
                                               vegan: item.vegan,
                                               vegetarian: item.vegetarian,
                                               nut_free: item.nut_free,
                                               dairy_free: item.dairy_free,
                                               available: item.available } }

      expect(response).to have_http_status(302).and redirect_to(product_path(item.id))
    end
  end

  describe 'DELETE /remove_dish' do

    # sign_in admin
    let(:new_item) { create(:product, :with_image) }

    before(:example) do
      get product_path(new_item.id)
    end

    it 'returns 302 Satus REDIRECT after sending the delete request' do
      sign_in admin
      delete product_path(new_item.id)
      expect(response).to have_http_status(:redirect).and redirect_to(products_path)
    end
  end

end
