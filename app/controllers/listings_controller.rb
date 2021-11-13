class ListingsController < ApplicationController
    before_action :authenticate_user!, only: %i[new create]
    
    def index
        @listings = Listing.all
    end

# Shows only 1 created listing of selling a second-hand game
    def show
    end
    
    def new
        @listing = Listing.new
    end

    def create
        @listing = current_user.listings.new(permitted_params)
        if @listing.save
            redirect_to listings_path
        else
            render :new
        end
    end

private

    def permitted_params
        params.required(:listing).permit(:listing_title, :description, :price, :console_id, :user_id) 
    end

    def set_listing
        id = params[:id]
        @listing = Listing.find(id)
    end
end
