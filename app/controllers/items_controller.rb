class ItemsController < ApplicationController

  def index
      @items = Item.all
    end
    
    def show
      @item = Item.find(params[:id])
      @wishlists = Wishlist.where(user_id: @logged_in_user_id)
      @wishlist_item = WishlistItem.new 
    end

end
