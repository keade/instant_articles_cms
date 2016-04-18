Rails.application.routes.draw do
  devise_for :users
  resources :posts
  
  root 'pages#index'
  
  # instant articles route
  get '/instant_feed' => 'posts#instant_feed', :defaults => { :format => 'rss' }

end
