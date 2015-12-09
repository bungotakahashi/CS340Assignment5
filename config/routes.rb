Rails.application.routes.draw do

  get 'apartment/room_new'
  post 'apartment/room_create'
  get 'apartment/room_update'
  get 'apartment/room_edit'
  get 'apartment/room_destroy'
  get 'apartment/room_show'
  get 'apartment/index'
  get 'apartment/room_layout'
  get 'apartment/layout_get_image'

  get 'apartment/resident'
  get 'apartment/resident_new'
  post 'apartment/resident_create'
  get 'apartment/resident_update'
  get 'apartment/resident_edit'
  get 'apartment/resident_destroy'
  get 'apartment/resident_show'
  get 'apartment/resident_document'
  get 'apartment/resident_get_image'

  get 'apartment/parking'
  get 'apartment/parking_new'
  post 'apartment/parking_create'
  post 'apartment/parking_update'
  get 'apartment/parking_edit'
  get 'apartment/parking_destroy'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  
  get 'home/index'             
  get 'home/show'              
  root to: "home#index"

  get 'users/index'
  get 'users/new'
  post 'users/create'
  get 'users/analysis'
  get 'users/destroy'
  get 'users/details'
  get 'users/analysis'
  get 'users/room_new'
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
