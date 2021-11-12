class MarketplacesController < ApplicationController
    def index
        @posts = Post.all
    end

# Shows only 1 created post of selling a second-hand game
    def show
    end
    
    def new
    end
end
