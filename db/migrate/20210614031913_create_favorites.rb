class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :cook_id
      t.timestamps
    end
    add_index :favorites, [:user_id, :cook_id], unique: true 
  end
end
