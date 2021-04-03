class CreateStyles < ActiveRecord::Migration[6.1]
  def change
    create_table :styles do |t|
      t.integer :user_id
      t.integer :outfit_id
      t.string :name
      t.string :era

      t.timestamps
    end
  end
end
