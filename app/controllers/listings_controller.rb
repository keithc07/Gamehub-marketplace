class ListingsController < ApplicationController
    before_action :authenticate_user!, only: %i[new create show edit update destroy]
    before_action :set_listing, only: %i[show edit update destroy]
    
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
            redirect_to @listing
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @listing.update(permitted_params)
            redirect_to @listing
        else
            render :edit
        end
    end

    def destroy
        @listing.destroy
            redirect_to listings_path, notice: 'Listing was successfully deleted.'
    end

private

    def permitted_params
        params.required(:listing).permit(:listing_title, :description, :price, :console_id, :user_id) 
    end

    def set_listing
        @listing = Listing.find(params[:id])
    end

end
