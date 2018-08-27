require "rails_helper"

describe ProductsController, type: :controller do

  before(:each) do
    @admin = FactoryBot.create(:random_user, admin: true)
  end

  context "unlogged users tries to create product" do
    it "renders login page" do
      get :new
      expect(response).not_to be_ok
      expect(response).to redirect_to(products_path)
      expect(flash[:alert]).to match("No soup for you. You not admin")
    end
  end

  context "admin creates product" do
    it "all works well" do
      sign_in @admin
      get :new
      expect(response).to be_ok
    end
  end
end
