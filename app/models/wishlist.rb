 class Wishlist < ApplicationRecord
    belongs_to :user
    has_many :wishlist_items, dependent: :destroy
    has_many :items, through: :wishlist_items

    validates :name, presence: true
    validates :category, presence: true


end
