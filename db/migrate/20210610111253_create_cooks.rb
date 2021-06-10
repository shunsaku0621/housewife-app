class CreateCooks < ActiveRecord::Migration[6.0]
  def change
    create_table :cooks do |t|
      t.string :name
      t.text :description
      t.float :portion
      t.text :point
      t.text :reference
      t.integer :time
      t.integer :appearance
      t.text :memo
      t.timestamps
    end
  end
end
