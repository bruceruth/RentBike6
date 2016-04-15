class Bike < ActiveRecord::Base

    has_one :rental
    
    def self.search(search_for)
        Bike.where("name = ?", search_for)
    end
    
end
