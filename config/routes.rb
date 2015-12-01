Rails.application.routes.draw do  
  # Main page with top selections
  root 'welcome#index'

  # Upvote selection pages
  post '/albums/:id/vote' => 'albums#vote', as: "vote_album"
  post '/books/:id/vote' => 'books#vote', as: "vote_book"
  post '/movies/:id/vote' => 'movies#vote', as: "vote_movie"

  # All resources for add, edit, delete, update the media
  resources :movies, :books, :albums
end
