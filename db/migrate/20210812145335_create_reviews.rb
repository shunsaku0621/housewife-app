class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :cook, foreign_key: true
      t.string :content
      t.integer :score, null: false
      t.timestamps
    end
  end
end
