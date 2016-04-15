class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :rentals
  
   def self.search(search_for)
        Profile.where("firstname = ?", search_for)
        Profile.where("lastname = ?", search_for)
   end
end
