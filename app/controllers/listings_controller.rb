class ListingsController < ApplicationController
    def index
        @listings = Listing.all
    end

# Shows only 1 created listing of selling a second-hand game
    def show
        @listing = Listing.find(params[:id])
    end
    
    def new
        @listing = Listing.new
        @console = Console.all
    end

    def create
        @listing = Listing.new(permitted_params)
        if @listing.save!
            redirect_to @listing
        else
            render('new')
        end
    end

private

    def permitted_params
        params.required(:listing).permit(:user, :listing_title, :console, :description, :price) 
    end

    def set_listing
        
    end
end
