Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users

  resources :urls

  get "/:short_code", to: 'short_urls#show', constraints: {short_code: /[0-9a-zA-Z]{6}/}
end
