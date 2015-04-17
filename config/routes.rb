Saffron::Application.routes.draw do

  get "events/submit"

  get "/events/custom_order", to: "events#custom_order"
  post "/events/save_order", to: "events#save_order"
  
  namespace :admin do
    resources :items, :menus, :events
  end

  devise_for :users
  get "/items/lunch", to: "items#lunch"
  get "/items/breakfast", to: "items#breakfast"
  get "/items/dinner", to: "items#dinner"
  resources :items, :except => :show
  resources :events
  get "welcome/index"
  match '/home' => 'welcome#index'
  match '/menu' => 'items#index'

  get '/menus/sample_menus', to: 'menus#sample_menus'
  get '/users/non_admin', to: 'users#non_admin'
  get '/users/add_admin/:id', to: 'users#add_admin'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
