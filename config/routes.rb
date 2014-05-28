Rails.application.routes.draw do
  devise_for :users

  root 'sites#index'

  resources :friendships

  get '/documents', to: 'documents#index'
  put '/documents', to: 'documents#update'

  get '/about', to: 'sites#about'
  get '/contact', to: 'sites#contact'

  get '/users/:id', to: 'users#show'

end


# Prefix Verb   URI Pattern                     Controller#Action
#         new_user_session GET    /users/sign_in(.:format)        devise/sessions#new
#             user_session POST   /users/sign_in(.:format)        devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)       devise/sessions#destroy
#            user_password POST   /users/password(.:format)       devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)   devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)  devise/passwords#edit
#                          PATCH  /users/password(.:format)       devise/passwords#update
#                          PUT    /users/password(.:format)       devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)         devise/registrations#cancel
#        user_registration POST   /users(.:format)                devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)        devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)           devise/registrations#edit
#                          PATCH  /users(.:format)                devise/registrations#update
#                          PUT    /users(.:format)                devise/registrations#update
#                          DELETE /users(.:format)                devise/registrations#destroy
#                     root GET    /                               sites#index
#              friendships GET    /friendships(.:format)          friendships#index
#                          POST   /friendships(.:format)          friendships#create
#           new_friendship GET    /friendships/new(.:format)      friendships#new
#          edit_friendship GET    /friendships/:id/edit(.:format) friendships#edit
#               friendship GET    /friendships/:id(.:format)      friendships#show
#                          PATCH  /friendships/:id(.:format)      friendships#update
#                          PUT    /friendships/:id(.:format)      friendships#update
#                          DELETE /friendships/:id(.:format)      friendships#destroy
#                    about GET    /about(.:format)                sites#about
#                  contact GET    /contact(.:format)              sites#contact
