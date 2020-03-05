class WishlistsController < ApplicationController

    skip_before_action :verify_authenticity_token

    def index
        @wishlists = Wishlist.where(user_id: @logged_in_user_id)
    end

    def show
        @wishlist = Wishlist.find(params[:id])
        @items = Item.all
        @wishlist_items = @wishlist.wishlist_items
    end

    def new
        @wishlist = Wishlist.new
    end

    def create
        @wishlist = Wishlist.new(wishlist_params)
        @wishlist.user_id = @logged_in_user_id
        if @wishlist.save
            redirect_to wishlist_path(@wishlist)
        else
            render :new
        end
    end
    
    def edit
        @wishlist = Wishlist.find(params[:id])
    end
    
    def update
        @wishlist = Wishlist.find(params[:id])

        @wishlist.update(wishlist_params)
        redirect_to wishlist_path(@wishlist)
    end
    
    def destroy
        @wishlist = Wishlist.find(params[:id])
        @wishlist.destroy
        redirect_to wishlists_path
    end
    
    private 
    
        def wishlist_params
            params.require(:wishlist).permit(:name, :category)
        end

end
