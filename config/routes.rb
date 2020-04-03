Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  scope "(:locale)", locale: /en|vi/ do
    root to: "static_pages#home"
    devise_for :users, controllers: { registrations: "users/registrations" }, skip: :omniauth_callbacks
    resources :demands do
      collection do
        match 'search' => 'demands#search', via: [:get, :post], as: :search
        match 'good_demand/search' => 'demands#search_good_demand', via: [:get, :post], as: :search_good_demand
     end
   end
    resources :teach_offers
    resources :invites
    resources :invite_items do
      member do
        patch :update_status, to: "invite_items#update_status"
      end
    end

    resources :users do
      get "/my_demands", to: "demands#my_demands"
    end
    resources :teachers do
      resources :comments
      get "/good_demand", to: "demands#good_demand"
    end

    get "admin/dashboard", to: "admin#dashboard"
    post '/rate' => 'rater#create', :as => 'rate'

    namespace :admin do
      resources :users, except: [:edit, :update] do
        member do
          delete :detroy_demand, to: "users#destroy_demand"
        end
      end
      resources :teachers do
        member do
          delete :detroy_demand, to: "teachers#destroy_demand"
        end
      end
      resources :demands
      resources :teach_offers
      resources :comments, except: [:edit, :update, :show]
      resources :charts, only: :index
      namespace :charts do
        get "teachers"
        get "teach_offers"
        get "teach_offers_approved"
        get "demands"
        get "users"
      end
    end
  end
end
