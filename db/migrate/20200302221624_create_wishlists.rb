class CreateWishlists < ActiveRecord::Migration[6.0]
  def change
    create_table :wishlists do |t|
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
