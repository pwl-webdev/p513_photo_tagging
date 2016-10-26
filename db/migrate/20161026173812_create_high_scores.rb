class CreateHighScores < ActiveRecord::Migration[5.0]
  def change
    create_table :high_scores do |t|
      t.string :p513ptid
      t.string :name
      t.belongs_to :puzzle
      t.timestamps
    end
  end
end
