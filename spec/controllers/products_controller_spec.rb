require 'rails_helper'

describe ProductsController, type: :controller do
  context 'unlogged users tries to create product' do
    it 'renders login page' do
      get :new
      expect(response).not_to be_ok
      expect(response).to redirect_to(products_path)
      expect(flash[:alert]).to match("No soup for you. You not admin")
    end
  end
end
