class TicTacToe
	attr_accessor :grid

	def output
		i = 0
		grid.each do |entry|
			i+= 1
			print entry
			((i%3) == 0) ? print "\n--------" : " | "
		end
	end

	def initialize
		puts "hi"
    @grid = [1,2,3,4,5,6,7,8,9]
    output
	end
end

TicTacToe.new