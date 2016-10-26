class Puzzle < ApplicationRecord
	mount_uploader :picture, PictureUploader
	has_many :guesses
	has_many :high_scores
end
