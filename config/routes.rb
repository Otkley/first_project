Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'posts#index'
  # get '/posts', to: 'posts#index' # posts_path
  get '/posts/:id', to: 'posts#show', as: 'post' # post_path(post)
  get '/posts/:id/edit', to: 'posts#edit', as: 'edit_post' # edit_post_path(post)
  patch '/posts/:id', to: 'posts#update'
end
