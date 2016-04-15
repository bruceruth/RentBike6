class Rental < ActiveRecord::Base
    belongs_to :user
    has_many :bikes
    
    #validates :rentalDuration, :range => 1..30
end
