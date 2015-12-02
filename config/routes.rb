Rails.application.routes.draw do  
  # Media indexes 
  get 'albums' => 'media#albums_index'
  get 'books' => 'media#books_index'
  get 'movies' => 'media#movies_index'

  # All resources for add, edit, delete, update the media

  resources :media

	resources :albums, controller: 'media', type: 'Album' 
	resources :books, controller: 'media', type: 'Book' 
	resources :movies, controller: 'media', type: 'Movie'

	post '/albums/:id/vote' => 'media#vote', controller: 'media', type: 'Album', as: :vote_album
  post '/books/:id/vote' => 'media#vote', controller: 'media', type: 'Book', as: :vote_book
  post '/movies/:id/vote' => 'media#vote', controller: 'media', type: 'Movie', as: :vote_movie

	root 'media#index'
end
