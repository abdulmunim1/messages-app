Rails.application.routes.draw do
  resources :messages, only: [:index, :create]

  # end
  # get 'pages/home'
  # post 'create_message', to: "pages#create_message"
  # get 'save_token', to: "pages#save_token"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users, only: [] do
    collection do
      get :save_token    
    end
  end
  root to: "messages#index" 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
