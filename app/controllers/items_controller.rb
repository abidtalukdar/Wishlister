class ItemsController < ApplicationController

  def index
      @items = Item.all
    end
    
    def show
      @item = Item.find(params[:id])
      @wishlists = Wishlist.all
      @wishlist_item = WishlistItem.new 
    end

end
