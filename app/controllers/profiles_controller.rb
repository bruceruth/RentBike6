require 'my_logger'

class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_admin, :only => [:edit, :destroy]
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  

  respond_to :html
  
    def ensure_admin
      unless current_user && current_user.admin?
        render :text => "Access Error Message", :status => :unauthorized
      end
    end
  
    def signedinuserprofile
      profile = Profile.find_by_user_id(current_user.id)
      if profile.nil?
        redirect_to "/profiles/new"
      else
        @profile = Profile.find_by_user_id(current_user.id)
        redirect_to "/profiles/#{@profile.id}"
      end
    end
  
    
    def index
      @profiles = Profile.all
      #respond_with(@profiles)
      
      if params[:search]
        @profiles = Profile.search(params[:search])
        @profiles = @profiles.order("created_at ASC")
      else
        @profiles = @profiles.order("created_at DESC")
      end
    end
  
    def show
      respond_with(@profile)
    end
  
    def new
      @profile = Profile.new
      @profile.user_id = current_user.id
      
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @profile }
      end
    end
  
    def edit
    end
  
    def create
      @profile = Profile.new(profile_params)
      @profile.save
      respond_with(@profile)
      
      #retrieve the instance/object of MyLogger class
      logger = MyLogger.instance
      logger.logInformation("A new profile has been created" + @profile.firstname + @profile.lastname)
      
    end
  
    def update
      @profile.update(profile_params)
      respond_with(@profile)
    end
  
    def destroy
      @profile.destroy
      respond_with(@profile)
    end
  
    private
      def set_profile
        @profile = Profile.find(params[:id])
      end
  
      def profile_params
        params.require(:profile).permit(:firstname, :lastname, :email, :address, :phone, :user_id)
      end
end

