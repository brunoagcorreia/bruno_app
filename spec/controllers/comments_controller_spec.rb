require 'rails_helper'

describe CommentsController, type: :controller do
  let(:test_user_1) { User.create!(first_name: 'Test1', email: 'test1@gmail.com', password: 'xxx_xx') }
  let(:product) { Product.create!(name: 'Trombone Pbone', brand: 'PBone', description: 'Plastic Trombone. Lightweight, great sound', image_url:'trombone_02.jpg', price: '199.99') }
  context 'only logged user' do
    before do
      sign_in test_user_1
    end
    it 'can add comments' do
      expect(Comment.new(
        body: 'b',
        user: test_user_1,
        product: product,
        rating: 4)
      ).to be_valid
    end
  end
end
