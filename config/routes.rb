Rails.application.routes.draw do
  devise_for :users

  root 'sites#index'

  get '/about', to: 'sites#about'
  get '/contact', to: 'sites#contact'

end
