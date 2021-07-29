class CreateGetmoneys < ActiveRecord::Migration[6.0]
  def change
    create_table :getmoneys do |t|

      t.timestamps
    end
  end
end
