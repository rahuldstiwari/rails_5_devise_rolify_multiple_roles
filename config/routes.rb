Rails.application.routes.draw do
  get 'dashboard/index'
  
  devise_for :users, controllers: { sessions: 'users/sessions',registrations: 'users/registrations' ,passwords: 'users/passwords'  }


  devise_scope :user do
    unauthenticated :user do
      root :to => "users/sessions#new"
    end
    authenticated :user do
      root :to => 'dashboard#index', as: :authenticated_path
    end
  end

    resources :users



  root 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
