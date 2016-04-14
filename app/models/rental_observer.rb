#saved in the file app/models/car_observer.rb
require 'my_logger'

class RentalObserver < ActiveRecord::Observer
    def after_create(record)
        # use the MyLogger instance method to retrieve the single instance/object of the class
        @logger = MyLogger.instance
        # use the logger to log/record a message about the updated car
        @logger.logInformation("***********************************************************************************")
        @logger.logInformation("+++ RentalObserver: The bike: #{record.biketype} has been rented. date #{record.date}")
        @logger.logInformation("***********************************************************************************")

    end
end
