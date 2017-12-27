Rails.application.routes.draw do

  #get 'renderers/hello'
  get 'hello' => "application#hello" #In controller "layouts" get "hello" method
  get 'say/hello' => "application#say_hello"
  get 'say/hello(/:your_name)' => "application#you_say"
  get '/' => "application#index"
  get 'times' => "application#times"
  get 'times/restart' => "application#restart"

  get 'products/index' #In controller "products" get "index" method
  # root 'produc ts#index' #Make root the "products" controller's "index" method
  get 'products' => "products#index"
  #  get 'products/new'

  # 1: Create ALL CRUD routes:
  # resources :users

  # 2: Create ALL EXCEPT:
  # resources :users, :except => [:show, :update]
  # generates actions for everything except for get "/users/:id"
  
  # 3: Create ONLY THIS/THESE:
  # resource :privacy_policy, only: [:show]
  # - means to only generate the get "/privacy_policy route for the Privacy Policy.
  
  # SIMILARLY:
  get 'users/total' => "users#total"
  resources :users, :only => [:index, :new, :create, :show, :edit]
  # resources :products, only: [:create]  # To only make the "create" CRUD route.
  # patch "users/:id" => "users#update"
  get 'users/total' => "users#total" #MAKE SURE THIS IS ABOVE GET 'users/:id' (i.e. above SHOW method)
  
  # FOR EDIT USER PAGE:
  # CAN DO EITHER:
  match 'users(/:id)' => "users#create", via: [:post] # (IN THE FORM on TEMPLATE COMMENT OUT line with _method=patch)
  # OR:
  # match 'users(/:id)' => "users#create", via: [:patch] or [:put] or [:patch, :put] (IN THE FORM on TEMPLATE ADD IN _method=patch) 

  
  #get "users" (users#index)
  #get "users/new"
  #post "users" (users#create)
 
  # this line will create 7 routes from the example above
  # resource(s) :products
  # get "products" => "products#index"
  # get "products/new" => "products#new"
  # post "products" => "products#create"
  # get "products/:id" => "products#show"
  # get "products/:id/edit" => "products#edit"
  # patch "products/:id" => "products#update"
  # delete "products/:id" => "products#destroy"
  # OR can manually create each:
  # (per single line, via general format: HTTP_VERB "<relative URL>" => "controller#method" )
  
  # CREATE OUR OWN CUSTOM ROUTE:
  # '/profile' will take the request to the users controller show method.
  # get "profile" => "users#show"
  # can also use 'match' method with :via [HTTP Verbs]

  #**********************************************************************************#
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
