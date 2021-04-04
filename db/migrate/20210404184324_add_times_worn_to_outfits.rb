class AddTimesWornToOutfits < ActiveRecord::Migration[6.1]
  def change
    add_column :outfits, :times_worn, :integer
  end
end
