Rails.application.routes.draw do
  resources :tasks do
    resources :answers do
      resources :comments
    end
  end

  get 'welcome', to: 'welcome#index'
  get 'about', to: 'welcome#about'

  root "welcome#index"

end
