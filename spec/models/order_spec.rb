require 'rails_helper'

describe Order do
  #validation test. A valid oder demands email and password - other fields are optional
  context 'order validation' do
    before(:each) do
      @product = FactoryBot.create(:random_product)
      @user = FactoryBot.create(:random_user)
    end
    # let(:product) { Product.create!(name: 'Test Guitar', brand: 'Test brand', description: 'Test instrument', image_url:'xxxx.jpg', price: '111.11') }
    # let(:user) { User.create!(first_name: 'John', email: 'test@gmail.com', password: 'xxx_xx') }

    it 'is not valid without product id' do
      expect(Order.new(
        user: @user)
      ).not_to be_valid
    end

    it 'only needs user and product' do
      expect(Order.new(
        user: @user,
        product: @product)
      ).to be_valid
    end
  end
end
