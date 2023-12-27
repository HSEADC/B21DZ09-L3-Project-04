Rails.application.routes.draw do
  devise_for :users

  resources :subscriptions, only: [:create, :show]

  resources :tasks do
  resources :answers do
    resources :comments, only: [:create]
  end
end

  # api
  namespace :api do
    namespace :v1 do
      resources :tasks, defaults: { format: :json }
    end
  end

  resources :profiles, only: [:show, :edit, :update]

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

  get 'welcome', to: 'welcome#index'
  get 'about', to: 'welcome#about'
  get 'allTasks', to: 'welcome#allTasks'
  get 'searchTasks', to: 'welcome#searchTasks'
  get 'howToPlay', to: 'welcome#howToPlay'
  # get 'profile', to: 'profiles#show'
  get 'answersGallery', to: 'tasks#answersGallery'

  root "welcome#index"

end
