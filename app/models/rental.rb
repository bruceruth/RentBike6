class Rental < ActiveRecord::Base
    belongs_to :user
    has_many :bikes
    
    
    
    
end
