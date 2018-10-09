require 'rails_helper'

describe Comment do
  #validation test. A valid review demands user, product, body (comment) and rating
  context 'if product has comments' do

    before(:each) do
      @product = FactoryBot.create(:random_product)
      @user = FactoryBot.create(:random_user)
    end
    # let(:product) { Product.create!(name: 'Test Guitar', brand: 'Test brand', description: 'Test instrument', image_url:'trombone_02.jpg', price: '111.11') }
    # let(:user) { User.create!(email: 'test@gmail.com', password: 'xxx_xx') }

    it 'is invalid without a comment' do
      expect(Comment.new(
        rating: 5,
        user: @user)
      ).not_to be_valid
    end

    it 'is invalid without a rating' do
      expect(Comment.new(
        body: Faker::Lebowski.quote,
        user: @user,
        product: @product,
        rating: 4)
      ).to be_valid
    end

    #checking if comment_factory is working
    it "is fine with user and products" do
      @comment = FactoryBot.create(:random_comment,
        user_id: @user.id,
        product_id: @product.id
      )
      expect(@comment).to be_valid
    end
  end
end
