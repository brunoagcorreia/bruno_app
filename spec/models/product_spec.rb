require 'rails_helper'

describe Product do
  context "when the product has reviews" do

    let(:product) { Product.create!(name: "Trombone Pbone", brand: "PBone", description: "Plastic Trombone. Lightweight, great sound", image_url:"trombone_02.jpg", price: "199.99") }
    let(:user) { User.create!(first_name: "Joan", email: "b.runocorreia@gmail.com", password: "u2208033") }

    before do
      product.comments.create!(rating: 1, user: user, body: "Awful sound!")
      product.comments.create!(rating: 3, user: user, body: "Not bad")
      product.comments.create!(rating: 5, user: user, body: "Kool Thing!")
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end

    it "is not valid without a name" do
      expect(Product.new(
        description: "que bueno!")
      ).not_to be_valid
    end

    it "needs email and password" do
      expect(User.new(
        email: "aa@aa.com",
        password: "xxx_xx")
      ).to be_valid
    end

  end
end
