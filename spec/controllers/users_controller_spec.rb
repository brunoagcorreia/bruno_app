require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) { User.create!(first_name: "Joan", email: "b.runocorreia@gmail.com", password: "xxx_xx") }
  let(:user) { User.create!(first_name: "Sanchez", email: "br.unocorreia@gmail.com", password: "xxx_xx") }

  describe 'GET #show' do
    context 'when a user is logged in' do
      before do
        sign_in user
      end
      it 'loads correct user details' do
        get :show, params: { id: user.id }
        expect(response).to be_ok
        expect(assigns(:user)).to eq user
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: user.id }
        #my doubt lays here. how does rails knows which page is being directed? i might be
        # GETting a page that does not require login
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
