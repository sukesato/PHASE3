Rails.application.routes.draw do
  root to: 'top#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :favorites, only: [:create, :destroy]
  
  resources :insts do
    collection do
      post :confirm
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
end
