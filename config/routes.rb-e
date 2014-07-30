Rails.application.routes.draw do
 
  # get 'demo/index'
  # root "demo#index"

    root "public#index"

    get 'subjects', :to => "subjects#index", as: 'view_subjects'
    

    get 'pages/:subject_id', :to => "pages#index", as: 'view_pages'
    get 'pages/new/:subject_id', :to => "pages#new", as: 'new_page'
    get 'pages/show/:subject_id/:page_id', :to => "pages#show", as: 'show_page'
    get 'pages/edit/:subject_id/:page_id', :to => "pages#edit", as: 'edit_page'
    get 'pages/delete/:subject_id/:page_id', 
        :to => "pages#delete", as: 'delete_page'

    get 'sections/:subject_id/:page_id', 
      :to => "sections#index", as: 'view_sections'

    get 'sections/new/:subject_id/:page_id', :to => "sections#new", as: 'new_section'
    get 'sections/show/:subject_id/:page_id/:section_id', 
      :to => "sections#show", as: 'show_section'

    get 'sections/edit/:subject_id/:page_id/:section_id', 
      :to => "sections#edit", as: 'edit_section'
    
    get 'sections/delete/:subject_id/:page_id/:section_id', 
      :to => "sections#delete", as: 'delete_section'
    

    


    get 'admin', :to => "access#index"
    get 'vehicles/:permalink', :to =>  "public#show", as: 'view_public'
    # get 'show/:permalink' , :to => 'public#show'
  
  # get 'show_new/:permalink' , :to => 'public#show_new'
  # get 'test', :to => "demo#index"
  
  # This is the default route. Should go to the bottom!
  match ':controller(/:action(/:id))' , :via => [:get, :post]

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
