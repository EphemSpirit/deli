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
        login_in admin
        get my_dishes_path
        expect(response).to have_http_status(:success)
      end

    end

    context 'when logged in' do

      before(:each) do
        sign_in user
        get my_dishes_path
      end

      it 'renders all products' do
        expect(assigns(:products)).to eq(Product.all)
      end

      it 'renders unique templates' do
        expect(response).to render_template('_admin_nav')
      end

    end

  end

  describe 'GET /new_dish' do

    context 'when logged in' do

      before(:each) do
        sign_in admin
        get new_dish_path
      end

      it 'is successful' do
        expect(response).to have_http_status(:success)
      end

      it 'renders new dish form' do
        expect(response).to have_selector('.new-dish-form')
      end

      it 'has control buttons' do
        expect(response).to have_selector('.back-btn')
        expect(response).to have_selector('.submit')
      end

    end

  end

  describe 'POST /new_dish' do

    before(:example) do
      sign_in admin
    end

    it 'will successfuly create a new dish' do

      new_item = build([:test_item, :with_image])

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

    before(:example) do
      sign_in admin
      item = create([:test_item, :with_image])
      get edit_dish_path(item.id)
    end

    it 'will render the edit form' do
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

    before(:example) do
      sign_in admin
      new_item = create([:test_item, :with_image])
      get dish_path(new_item.id)
    end

    it 'returns 200 Satus OK after sending the delete request' do
      expect { delete remove_dish_path(new_item.id) }.to have_http_status(:success).and redirect_to(my_dishes_path)
    end
  end

end
