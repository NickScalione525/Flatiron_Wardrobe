class AddNameToOutfits < ActiveRecord::Migration[6.1]
  def change
    add_column :outfits, :name, :string
  end
end
