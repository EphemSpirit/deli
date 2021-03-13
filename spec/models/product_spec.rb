require 'rails_helper'

RSpec.describe Product, type: :model do

  context "validations" do

    let(:product) { build(:product) }

    it 'is valid' do
      expect(product).to be_valid
    end

    it 'is invalid without a name' do
      product.name = nil
      expect(product).not_to be_valid
    end

    it 'is invalid without a price' do
      product.price = nil
    end

    it 'is invalid without a description' do
      product.description = nil
      expect(product).not_to be_valid
    end

  end

  context 'database persistance and associations' do

    let(:product) { build(:product) }

    it 'persists to the database' do
      expect { product.save }.to change{ Product.count }.by(1)
    end

  end

end
