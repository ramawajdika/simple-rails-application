Rails.application.routes.draw do

  devise_for :users
  get 'welcome/index'
  resources :articles do
    resources :comments
    collection do
      get :all_articles
    end
  end
  resources :articles do
    collection {post :import}
  end
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
