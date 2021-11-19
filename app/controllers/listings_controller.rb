class ListingsController < ApplicationController
    # Authenicate the user before directing to the pages under these actions "new/create/show/edit/update/destroy"
    before_action :authenticate_user!, only: %i[new create show edit update destroy]
    # show a listing with the corresponding listing_id before directing to the pages under these actions "show/edit/update/destroy"
    before_action :set_listing, only: %i[show edit update destroy]
    
    # Shows all the created listing in the index page
    # Minimize database calls on listing model
    def index
        @listings = Listing.includes(:console, :user, user: [:state]).all
        @consoles = Console.all
    end

    # Shows only 1 created listing in the show page
    def show
    end
    
    # Create a new instance variable for Listing
    def new
        @listing = Listing.new
    end

    # Call the instance variable from action "new"
    # Verify there is a user before creating a new listing 
    def create
        @listing = current_user.listings.new(permitted_params)
        # If the created listing successfully saved/created, redirect to the show page/ newly created listing page
        if @listing.save
            redirect_to @listing
        else
            # render the create / new page
            render :new
        end
    end

    def edit
        # Authoization where only the listing creator can edit the listing
        authorize @listing
    end

    def update
        # Authoization where only the listing creator can update the listing
        authorize @listing

        # If the created listing successfully updated, redirect to the show page/ updated listing page
        if @listing.update(permitted_params)
            redirect_to @listing
        else
             # render the edit page
            render :edit
        end
    end

    def destroy
        # Authoization where only the listing creator can delete the listing
        authorize @listing

        # Destroy the listing after a notice appears to check whether the user confirm to delete the listing
        @listing.destroy
            redirect_to listings_path, notice: 'Listing was successfully deleted.'
    end

private

    # Allow model attributes for mass update towards the database where only stated strong parameters are permitted
    def permitted_params
        params.required(:listing).permit(:listing_title, :description, :price, :console_id, :user_id, :picture) 
    end

    # show a listing with the corresponding listing_id
    def set_listing
        @listing = Listing.find(params[:id])
    end

end
