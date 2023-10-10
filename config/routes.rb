Rails.application.routes.draw do
  resources :answers
  resources :tasks do
    resources :comments
  end

  get 'welcome', to: 'welcome#index'
  get 'about', to: 'welcome#about'

  root "welcome#index"

end
