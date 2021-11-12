class MarketplacesController < ApplicationController


    def index
        @posts = Post.all
    end

# Shows only 1 created post of selling a second-hand game
    def show

    end
    
    def new
        @post = Post.new
    end

    def create
        @post = Post.new permitted_params
        if @post.save
            redirect_to @post
        else
            render :new
        end
    end

private

    def permitted_params
        params.required(:post).permit(:listing_title, :description, :price, console_ids: []) 
    end
end
