Rails.application.routes.draw do
  devise_for :users
  resources :tasks do
    resources :answers do
      resources :comments
    end
  end

  get 'welcome', to: 'welcome#index'
  get 'about', to: 'welcome#about'

  root "welcome#index"

end
