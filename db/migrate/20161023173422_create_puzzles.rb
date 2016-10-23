class CreatePuzzles < ActiveRecord::Migration[5.0]
  def change
    create_table :puzzles do |t|
      t.integer :wally_x
      t.integer :wally_y
      t.timestamps
    end
  end
end
