Rails.application.routes.draw do
  post 'support/request_support'
  devise_for :users

  resources :subscriptions, only: [:create, :show]

  get 'onboarding-passed', to: 'onboardings#set_passed', as: 'onboarding_passed'
  get 'alert-passed', to: 'alerts#set_passed', as: 'alert_passed'
  get 'alert-unpassed', to: 'alerts#set_unpassed', as: 'alert_unpassed'
  get 'alert-blocked', to: 'alerts#set_blocked', as: 'alert_blocked'

  resources :tasks do
    resources :answers do
      resources :comments
    end
  end

  # api
  namespace :api do
    namespace :v1 do
      resources :tasks, defaults: { format: :json } do
        resources :answers, defaults: { format: :json }
      end
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
        post "sign_out", to: "sessions#destroy"

        #post "update/:id", to: "users#update"
      end
    end

    namespace :v2 do
      resources :tasks, defaults: { format: :json } do
        resources :answers, defaults: { format: :json }  do
          resources :comments, defaults: { format: :jsom }
        end
      end
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
  get 'expireTasks', to: 'welcome#expireTasks'
  get 'howToPlay', to: 'welcome#howToPlay'
  get 'support', to: 'support#index'
  # get 'profile', to: 'profiles#show'
  get 'answersGallery', to: 'tasks#answersGallery'

  root "welcome#index"

end
