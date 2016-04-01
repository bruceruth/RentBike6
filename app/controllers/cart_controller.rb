class CartController < ApplicationController

before_action :authenticate_user!, except: [:index]

  
  def add
    id = params[:id]
      #if the cart has already been created, use the existing cart, else create new cart
      if session[:cart] then
        cart = session[:cart]
      else
        session[:cart] = {}
        cart = session[:cart]
      end
    
    #if the product/bike has already been added to the cart, increment the value, esle set the value to 1
    if cart[id] then
      cart[id] = cart[id] + 1
    else 
      cart[id] = 1
    end
    redirect_to :action => :index
  end #end add method
  
    def clearCart # will just remove all items and return user to cart index page - empty cart
      session[:cart] = nil
      redirect_to :action => :index
    end 
  
  def index # this indes is the cart
    #if there is a cart, pass it to the page for display else pass an empty value
    if session[:cart] then
        @cart = session[:cart]
    else
        @cart = {}
    end
  end

end

