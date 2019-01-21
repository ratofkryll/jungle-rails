require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @category = Category.create! name: 'Category'
    @product = @category.products.new({
      name: 'Product',
      quantity: 1,
      price: 100
      })
  end
  describe 'Validations' do
    it 'is not valid without a name' do
      @product.name = nil
      expect(@product).to_not be_valid
    end
    it 'is not valid without a price' do
      @product.price_cents = nil
      expect(@product).to_not be_valid
    end
    it 'is not valid without a quantity' do
      @product.quantity = nil
      expect(@product).to_not be_valid
    end
    it 'is not valid without a category' do
      @product = Product.new({
        name: 'Product',
        quantity: 1,
        price: 100
        })
      expect(@product).to_not be_valid
    end
    it 'saves errors in errors.full_messages' do
      @product = Product.create({
        name: 'Product',
        quantity: 1,
        price: 100
        })
      expect(@product.errors.full_messages).to_not be_empty
    end
  end
end
