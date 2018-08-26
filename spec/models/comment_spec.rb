require 'rails_helper'

describe Comment do
  #validation test. A valid review demands user, product, body (comment) and rating
  context "if product has comments" do

    let(:product) { Product.create!(name: "Test Guitar", brand: "Test brand", description: "Test instrument", image_url:"trombone_02.jpg", price: "111.11") }
    let(:user) { User.create!(email: "test@gmail.com", password: "xxx_xx") }

    it "is invalid without a comment" do
      expect(Comment.new(
        rating: 5,
        user: user)
      ).not_to be_valid
    end

    it "is invalid without a rating" do
      expect(Comment.new(
        body: "b",
        user: user,
        product: product,
        rating: 4)
      ).to be_valid
    end
  end
end
