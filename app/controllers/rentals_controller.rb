class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]


  respond_to :html

  def index
    @rentals = Rental.all
    respond_with(@rentals)
  end

  def show
    respond_with(@rental)
  end
  
#  def create
#    @rental = Rental.new(params[:rental])
#    if @rental.save
#      redirect_to new_rental_path
#    end
#  en0d
  
  def create
    @rental = Rental.new(rental_params)
    rentbikeId = params[:rental][:bikes]
    puts "I'm here"
    puts params.inspect
    
    bike = Bike.find(rentbikeId)
    @rental.biketype = bike.name
    @rental.cost = bike.price


    respond_to do |format|
      if @rental.save
      format.html { redirect_to @rental, notice: 'Rental was successfully created.' }
        format.json { render :show, status: :created, location: @rental }
      else
        format.html { render :new }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @rental = Rental.new
    respond_with(@rentaget)
    
  end

  def edit
  end

  def update
    @rental.update(rental_params)
    respond_with(@rental)
  end

  def destroy
    @rental.destroy
    respond_with(@rental)
  end

  private
    def set_rental
      @rental = Rental.find(params[:id])
    end

    def rental_params
      params.require(:rental).permit(:date, :type, :rentalDuration)
    end
end
