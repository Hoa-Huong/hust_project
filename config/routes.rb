Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root to: "static_pages#home"
    devise_for :users, controllers: { registrations: "users/registrations" }
    resources :demands
    resources :teachers
    resources :teach_offers

    resources :users do
      get "/my_demands", to: "demands#my_demands"
    end
    resources :teachers do
      resources :comments
    end

    get "admin/dashboard", to: "admin#dashboard"
    post '/rate' => 'rater#create', :as => 'rate'

    namespace :admin do
      resources :users, except: [:edit, :update]
      resources :teachers
      resources :demands
      resources :teach_offers
    end
  end
end
