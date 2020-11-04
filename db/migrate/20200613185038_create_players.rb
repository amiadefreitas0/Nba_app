class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.integer :height_feet
      t.string :position
      t.integer :weight_pounds
      t.integer :height_inches

      t.timestamps
    end
  end
end
