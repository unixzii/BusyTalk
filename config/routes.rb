Rails.application.routes.draw do

  root 'main#index'

  get '/categories' => 'main#categories'

  get '/public_post' => 'main#public_post'
  get '/add_category' => 'main#add_category'
  get '/signup' => 'main#signup'
  get '/login' => 'main#login'
  get '/logout' => 'main#logout'

  get '/actions/admin-bin/add_category.do' => 'admin#add_category'
  post '/actions/admin-bin/public_post.do' => 'admin#public_post'
  post '/actions/admin-bin/signup.do' => 'admin#signup'
  post '/actions/admin-bin/login.do' => 'admin#login'

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
