Rails.application.routes.draw do
  resources :people
  get "/index" => "people#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  match ':controller(/:action(/:id(.:format)))', :via => :all
end
