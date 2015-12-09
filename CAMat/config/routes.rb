# -*- encoding : utf-8 -*-
CAMat::Application.routes.draw do

  get "password_resets/new"

  get "password_resets/edit"

  get 'feed/edit'

  get "raffles/delete"

  get "raffles/edit"

  root :to => 'home#index'

  get "home/index"
  get "accounts/destroy"
  get "users/edit"
  get "users/show"
  get    'msg'     => 'feed#create'
  get    'home'    => 'home#index'
  get    'locker_occupation' => 'lockers#occupied_lockers_list'
  get    'lockers' => 'lockers#index'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  post   'subscribe' => 'raffles#subscribe'
  post   'unsubscribe' => 'raffles#unsubscribe'
  post   'requirement' => 'requirement_raffles#subscribe'
  get   'requirementcancel' => 'requirement_raffles#unsubscribe' 
  post   'requirementcancel' => 'requirement_raffles#unsubscribe'   
  resources :users, :accounts, :raffles, :feed, :requirement_raffles
  resources :password_resets, only: [:new, :create, :edit, :update]

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
