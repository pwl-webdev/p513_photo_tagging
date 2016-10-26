class PuzzlesController < ApplicationController
	def index
		@puzzles = Puzzle.all
	end
	def show
		@puzzle = Puzzle.find(params[:id])
		respond_to do |format|
			format.html {
				@start_time = Time.now
			}
			format.json {
				@resp
				if (params[:posX].to_i >= @puzzle.wally_x && params[:posX].to_i <= (@puzzle.wally_x + @puzzle.wally_dx) && params[:posY].to_i >= @puzzle.wally_y && params[:posY].to_i <= (@puzzle.wally_y + @puzzle.wally_dy)) then
					puts "wally found!"
					@resp = "success"
					@end_time = Time.now
					#render json: {status: @resp, time: (@end_time - @start_time)}.to_json
					render json: {status: @resp}.to_json
				else 
					puts "wally not found!"
					@resp = "fail"
					render json: {status: @resp}.to_json
				end

			}

		end
	end

	#private 
	#def puzzle_params
	#	params.require().permit(:id, :posX, :posY)
	#end
end
