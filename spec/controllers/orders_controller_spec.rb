require "rails_helper"

describe OrdersController, type: :controller do
  before(:each) do
    @admin = FactoryBot.create(:random_user, admin: true)
    @user = FactoryBot.create(:random_user)
  end

  context "unlogged user tries to access orders" do
    it "renders login page" do
      get :index
      expect(response).not_to be_ok
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context "admin" do
      it "can access the orders page" do
      sign_in @admin
      get :index
      expect(response).to be_ok
    end
  end

end
