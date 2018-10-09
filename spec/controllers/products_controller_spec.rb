require "rails_helper"

describe ProductsController, type: :controller do

  before(:each) do
    @admin = FactoryBot.create(:random_user, admin: true)
    @user = FactoryBot.create(:random_user, admin: false)
    @product = FactoryBot.create(:random_product)
  end

  context "common user perform admin actions" do
    before do
      sign_in @user
    end
    it "redirects to products page" do
      get :new
      expect(response).not_to be_ok
      expect(response).to redirect_to(products_path)
      expect(flash[:alert]).to match("No soup for you. You not admin")
    end
    it "redirects to products page" do
      get :edit, params: { id: @product.id }
      expect(response).not_to be_ok
      expect(response).to redirect_to(products_path)
      expect(flash[:alert]).to match("No soup for you. You not admin")
    end
    it "redirects to products page" do
      get :destroy, params: { id: @product.id }
      expect(response).not_to be_ok
      expect(response).to redirect_to(products_path)
      expect(flash[:alert]).to match("No soup for you. You not admin")
    end
    it "redirects to products page" do
      get :update, params: { id: @product.id }
      expect(response).not_to be_ok
      expect(response).to redirect_to(products_path)
      expect(flash[:alert]).to match("No soup for you. You not admin")
    end
  end


  context "admin logged in" do
    before do
      sign_in @admin
    end
    it "can create a product" do
      get :new
      expect(response).to be_ok
    end
    it 'renders the edit template' do
      get :edit, params: { id: @product.id }
      expect(assigns(:product)).to eq @product
      expect(response).to render_template('edit')
    end
  end

  context 'when a user goes to index page' do
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  context 'when any user goes to a product page' do
    it 'renders the product page' do
      get :show, params: { id: @product.id }
      expect(assigns(:product)).to eq @product
    end
  end
end
