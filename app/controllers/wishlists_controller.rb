class WishlistsController < ApplicationController

    CATEGORY = ["Wedding", "Bridal Shower", "Baby Shower", "Bat Mitzvah", "Quinceanera", "Birthday", "Christmas"]

    def index
        @wishlists = Wishlist.all
    end

    def show
        @wishlist = Wishlist.find(params[:id])
        @items = Item.all
        @wishlist_items = @wishlist.wishlist_items
        # @wishlist_item = WishlistItem.new <- only add this if you want users to add on the Wishlist show page
    end

    def new
        @wishlist = Wishlist.new
    end

    def create
        @wishlist = Wishlist.new(wishlist_params)
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
