class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :guesses do |t|
      t.string :p513ptid
      t.belongs_to :puzzle
      t.integer :guess_time
      t.timestamps
    end
  end
end
