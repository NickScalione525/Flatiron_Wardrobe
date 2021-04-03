class CreateOutfits < ActiveRecord::Migration[6.1]
  def change
    create_table :outfits do |t|
      t.string :top
      t.string :bottom
      t.string :shoes
      t.text :accessories

      t.timestamps
    end
  end
end
