require 'rails_helper'

describe OrdersController, type: :controller do
  context 'unlogged users tries to access orders' do
    it 'renders login page' do
      get :index
      expect(response).not_to be_ok
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
