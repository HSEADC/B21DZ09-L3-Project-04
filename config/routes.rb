Rails.application.routes.draw do
  devise_for :users

  resources :subscriptions, only: [:create, :show]

  get 'welcome', to: 'welcome#index'
  get 'about', to: 'welcome#about'

  root "welcome#index"

  # api
  namespace :api do
    namespace :v1 do
      resources :tasks
    end
  end

  namespace :admin do
    resources :tasks do
      resources :answers do
        resources :comments, except: :show
      end
    end

     resources :answers
    #   resources :comments, except: :show
    # end
    #
    resources :subscriptions

    root "admin/tasks#index"
  end
end
