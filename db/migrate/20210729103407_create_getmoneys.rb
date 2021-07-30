class CreateGetmoneys < ActiveRecord::Migration[6.0]
  def change
    create_table :getmoneys do |t|
      t.integer :amount, null: false
      t.integer :category2_id, null: false
      t.text :memo
      t.datetime :start_time, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
