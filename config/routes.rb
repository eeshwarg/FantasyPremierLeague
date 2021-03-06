FantasyPremierLeague::Application.routes.draw do
  resources :red_cards

  resources :saves

  resources :assists

  resources :goals

  resources :games

  resources :players

  resources :teams

  get "sessions/login"
  post "/login" => 'sessions#login'
  post "sessions/login" => 'sessions#login'
  get "sessions/home"

  get "sessions/profile"
  get "sessions/settings"
  get "login_attempt", :to => "sessions#login_attempt"
  post "login_attempt", :to => "sessions#login_attempt"
  post "sessions/logout"
  resources :users, :sessions
  root 'sessions#login'
  get '/new' => 'users#new'
  post '/new' => 'users#new'

  get '/fetch_players' => 'players#fetch_players'

  get '/buy_player' => 'users#buy_player'

  get '/sell_player' => 'users#sell_player'

  get '/list_players' => 'users#list_players'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
