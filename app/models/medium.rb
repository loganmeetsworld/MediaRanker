class Medium < ActiveRecord::Base
	# Validations
	validates :name, presence: true
	validates :type, presence: true, inclusion: { in: %w(album book movie)}

	# Scopes 
	scope :albums, -> { where(type: 'Album') } 
	scope :books, -> { where(type: 'Book') } 
	scope :movies, -> { where(type: 'Movie') }
end
