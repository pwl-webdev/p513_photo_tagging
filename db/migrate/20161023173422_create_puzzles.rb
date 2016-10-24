class CreatePuzzles < ActiveRecord::Migration[5.0]
  def change
    create_table :puzzles do |t|
      t.integer :wally_x
      t.integer :wally_y
      t.integer :wally_dx
      t.integer :wally_dy
      t.integer :width
      t.timestamps
    end
  end
end
