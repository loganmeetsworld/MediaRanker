Rails.application.routes.draw do  
  # Main page with top selections
  root 'welcome#index'

  # Upvote selection pages
  post '/albums/:id/vote' => 'albums#vote'
  post '/books/:id/vote' => 'books#vote'
  post '/movies/:id/vote' => 'movies#vote'

  # All resources for add, edit, delete, update the media
  resources :movies, :books, :albums
end
