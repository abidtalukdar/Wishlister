class WishlistItemsController < ApplicationController

    def create
        @wishlist_item = WishlistItem.create(params.require(:wishlist_item).permit(:wishlist_id, :item_id))
        redirect_to @wishlist_item.item
    end

    def destroy
        @wishlist_item = WishlistItem.find(params[:id])
        @wishlist_item.destroy
        redirect_to wishlist_path(@wishlist_item.wishlist)
    end

end