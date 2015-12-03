class Medium < ActiveRecord::Base
  # Validations
  validates :name, presence: true
  validates :type, presence: true

  # Scopes 
  def self.types
    %w(Album Book Movie)
  end 

  scope :albums, -> { where(type: 'Album') } 
  scope :books, -> { where(type: 'Book') } 
  scope :movies, -> { where(type: 'Movie') }
end

class Album < Medium; end 
class Book < Medium; end 
class Movie < Medium; end