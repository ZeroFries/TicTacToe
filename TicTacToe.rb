class TicTacToe
	attr_accessor :grid, :player

	def horizantal_win(row)
		pos = row * 3
		grid[pos]==grid[pos+1] && grid[pos+1]==grid[pos+2]
	end

	def verticle_win(col)
		grid[col]==grid[col+3] && grid[col+3]==grid[col+6]
	end

	def diagonal_win
		grid[0]==grid[4] && grid[4]==grid[8]
	end

	def winner  #finds winning player
    if horizantal_win(0) || diagonal_win || verticle_win(0)
    	grid[0]=="x" ? 1 : 2
    elsif horizantal_win(1) || verticle_win(1)
    	grid[4]=="x" ? 1 : 2
    elsif horizantal_win(2) || verticle_win(2)
      grid[8]=="x" ? 1 : 2
    else
  		nil
  	end
	end

	def win?
		!winner.nil?
	end

	def output  #prints the grid
		i = 0
		puts "\n-----------------------------------------------------------\n\n"
		grid.each do |entry|
			i+= 1
			print entry
			print ((i%3) == 0) ? "\n---------\n" : " | "
		end
	end

	def initialize  #new game
		@player = 1
    @grid = [1,2,3,4,5,6,7,8,9]
    turns = 9
    play = 0

    loop do
    	break if win? || turns == 0
      output
      puts "\nPlayer #{player}, type 1-9 to play in the corresponding spot"
      play = gets.to_i-1

      while !grid.include?(play+1)  #check valid input
      	puts "Make a proper play!"
      	play = gets.to_i-1
      end


      if player == 1
      	grid[play] = "X"
      	@player = 2
      else
      	grid[play] = "O"
      	@player = 1
      end
      turns-= 1
    end

    #End of game
    output
 		if win?
    	puts "PLAYER #{winner} WINS!"
    else
    	puts "TIE!"
    end
	end
end

TicTacToe.new