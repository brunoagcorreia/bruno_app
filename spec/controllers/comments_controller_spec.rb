require "rails_helper"

describe CommentsController, type: :controller do
  before(:each) do
    @user1 = FactoryBot.create(:random_user)
    @user2 = FactoryBot.create(:random_user)
    @admin = FactoryBot.create(:random_user, admin: true)
    @product = FactoryBot.create(:random_product)
  end

  # let(:test_user_1) { User.create!(first_name: "Test1", email: "test1@gmail.com", password: "xxx_xx") }
  # let(:product) { Product.create!(name: "Trombone Pbone", brand: "PBone", description: "Plastic Trombone. Lightweight, great sound", image_url:"trombone_02.jpg", price: "199.99") }
  context "only logged user" do
    before do
      sign_in @user1
    end
    it "can add comments" do
      expect(Comment.new(
        body: "b",
        user: @user1,
        product: @product,
        rating: 4)
      ).to be_valid
    end
  end

  context "random comment from products" do
    before(:each) do
      @comment = FactoryBot.create(:random_comment,
        user_id: @admin.id,
        product_id: @product.id)
    end
    it "can be deleted by admin" do
      sign_in @admin
      expect{ @comment.destroy }.to change(Comment, :count).by(-1)
      expect(response).to be_ok
    end
  end

end
