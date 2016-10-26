class PuzzlesController < ApplicationController
	def index
		@puzzles = Puzzle.all
	end
	def show
		@puzzle = Puzzle.find(params[:id])

		respond_to do |format|
			format.html {
				p513ptid = SecureRandom.hex(6)
				cookies[:p513ptid] = p513ptid
				Guess.create(p513ptid: p513ptid, puzzle_id: @puzzle.id)
			}
			format.json {
				@resp
				if (params[:posX].to_i >= @puzzle.wally_x && params[:posX].to_i <= (@puzzle.wally_x + @puzzle.wally_dx) && params[:posY].to_i >= @puzzle.wally_y && params[:posY].to_i <= (@puzzle.wally_y + @puzzle.wally_dy)) then
					@user = Guess.find_by(p513ptid: cookies[:p513ptid], puzzle_id: @puzzle.id)
					if @user then 
						puts "wally found!"
						puts "time start: "
						puts @user.created_at
						@time = (Time.now - @user.created_at).round
						puts "time passed: "
						puts @time
						@user.update(guess_time: @time)
						@resp = "success"
						render json: {status: @resp, time: @time}.to_json
					end
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
