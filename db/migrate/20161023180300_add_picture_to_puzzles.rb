class AddPictureToPuzzles < ActiveRecord::Migration[5.0]
  def change
    add_column :puzzles, :picture, :string
  end
end
