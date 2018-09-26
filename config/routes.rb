Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { registrations: "user_registrations" }

  resources :products do
    resources :comments
  end

  resources :users

  resources :orders, only: [:index, :show, :create, :destroy]

  get 'simple_pages/gdpr'
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'

  root 'simple_pages#landing_page'

  post 'simple_pages/thank_you'
  post 'payments/create'

  #for custom error page
  # %w( 404 422 500 ).each do |code|
  #   get code, controller: :application, action: :error, code: code
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
