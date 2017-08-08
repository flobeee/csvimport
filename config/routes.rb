Rails.application.routes.draw do
  get 'restmanagers/index'

  get 'restmanagers/import'

  get 'restmanagers/update'

  get 'restmanagers/create'

  resources :products do
    collection { post :import }
  end

  root to: "products#index"
  get 'import' => 'products#import'
end
