Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root to: "static_pages#home"
    devise_for :users, controllers: { registrations: "users/registrations" }
    resources :demands
    resources :teachers
    resources :users do
      get "/my_demands", to: "demands#my_demands"
    end
  end
end
