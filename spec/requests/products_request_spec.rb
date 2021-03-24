require 'rails_helper'

RSpec.describe "Products", type: :request do

  let(:admin) { create(:admin) }

  describe 'GET /my_dishes' do

    # before(:example) { get my_dishes_path }

    context 'not logged in' do

      it 'redirects to login when not signed in' do
        get my_dishes_path
        expect(response).to redirect_to(admin_session_path)
      end

      it 'is successful when logged in' do
        sign_in admin
        get my_dishes_path
        expect(response).to have_http_status(:success)
      end

    end

    context 'when logged in' do

      # sign_in admin

      before(:each) do
        get my_dishes_path
      end

      it 'renders all products' do
        sign_in admin
        expect(assigns(:products)).to eq(Product.all)
      end

      it 'renders unique templates' do
        sign_in admin
        expect(response).to render_template('_admin_nav')
      end

    end

  end

  describe 'GET /new_dish' do

    context 'when logged in' do

      # sign_in admin

      before(:each) do
        get new_dish_path
      end

      it 'is successful' do
        sign_in admin
        expect(response).to have_http_status(:success)
      end

      it 'renders new dish form' do
        sign_in admin
        expect(response).to have_selector('.product-form')
      end

      it 'has control buttons' do
        sign_in admin
        expect(response).to have_selector('.back-btn')
        expect(response).to have_selector('.submit')
      end

    end

  end

  describe 'POST /new_dish' do

    # sign_in admin

    it 'will successfuly create a new dish' do

      new_item = build(:product, :with_image)

      sign_in admin

      get new_dish_path

      post new_dish_path, params: { product: { name: new_item.name,
                                               price: new_item.price,
                                               description: new_item.description,
                                               vegan: new_item.vegan,
                                               vegetarian: new_item.vegetarian,
                                               nut_free: new_item.nut_free,
                                               dairy_free: new_item.dairy_free,
                                               available: new_item.available,
                                               image: new_item.image } }

      expect(response).to have_http_status(:success).and redirect_to(dish_path(new_item.id))
    end
  end

  describe 'GET /edit_dish' do

    # sign_in admin

    before(:example) do
      item = create(:product, :with_image)
      get edit_dish_path(item.id)
    end

    it 'will render the edit form' do
      sign_in admin
      expect(response).to have_selector("Name", text: item.name)
      expect(response).to have_selector("Price", text: item.price)
      expect(response).to have_selector("Description", text: item.description)
      expect(response).to have_selector("Vegan", text: item.vegan.to_s)
      expect(repsonse).to have_selector("Vegetarian", text: item.vegetarian.to_s)
      expect(response).to have_selector("Dairy Free", text: item.dairy_free.to_s)
      expect(response).to have_selector("Nut Free", text: item.nut_free.to_s)
      expect(response).to have_selector("Available", text: item.available.to_s)
    end

    it 'successfully updates an item' do
      sign_in admin
      item.available = false

      patch edit_dish_path(item.id), params: { product: { name: new_item.name,
                                               price: new_item.price,
                                               description: new_item.description,
                                               vegan: new_item.vegan,
                                               vegetarian: new_item.vegetarian,
                                               nut_free: new_item.nut_free,
                                               dairy_free: new_item.dairy_free,
                                               available: new_item.available,
                                               image: new_item.image } }

      expect(response).to have_http_status(:success).and redirect_to(dish_path(item.id))
    end
  end

  describe 'DELETE /remove_dish' do

    # sign_in admin

    before(:example) do
      new_item = create(:product, :with_image)
      get dish_path(new_item.id)
    end

    it 'returns 200 Satus OK after sending the delete request' do
      sign_in admin
      expect { delete remove_dish_path(new_item.id) }.to have_http_status(:success).and redirect_to(my_dishes_path)
    end
  end

end
