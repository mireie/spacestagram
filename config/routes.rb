Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :likes
    collection do
      post :create_posts
    end
  end

  root to: "posts#index"
end
