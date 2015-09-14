class Mastermind

	def start
		puts "Choose to play as: "
		puts "1 - Codemaker"
		puts "2 - Codebreaker"
		puts "Press 1 or 2"

		user_choice = gets.chomp

		if user_choice == "1"
			new_codemaker = Codemaker.new		
			new_codemaker.start
		elsif user_choice == "2"
			new_codebreaker = Codebreaker.new
			new_codebreaker.start
		else
			puts "Press only 1 or 2"
			start
		end
	end

end

class Codemaker

	def initialize
		@code = []
	end

	def start
		puts "--INITALIZING CODEMAKER MODE--"
		puts "CodeMaker, Lets start the game!!"
		puts "="*33
		new_board = Board.new	
		@code = new_board.select_code
		puts "This is the secret code!"
		puts "^"*33	
		new_board.get_user_code(@code)
		new_board.start_ai
	end	

end

class Codebreaker

	def start
		puts "--INITALIZING CODEBREAKER MODE--"
		puts "Codebreaker, Lets start the game!!"
		puts "="*33
		new_board = Board.new		
		new_board.auto_generate_code
		new_board.start
	end

end

class Board

	def initialize	
		@color_codes = ["R", "G", "B", "Y", "O", "P"]	
		@user_code = []
		@code = []
		@guess_code = []
		@white_peg = 0 #matching color only
		@black_peg = 0 #matching color and position
		@score = 0	
	end

	def start
		12.times do |i|
			@black_peg = 0
			@white_peg = 0
			@guess_code = [] 
			run(i)
		end	
		lose	
	end

	def start_ai
		puts "A Wild Guess!!"

	end

	def run(i)	
		puts "Attempt no.#{i+1}"
		puts "-"*33
		select_code
		compare_codes(@guess_code,@code)
		puts "-"*33
		puts "You have: #{@white_peg} White Pegs"
		puts "You have: #{@black_peg} Black Pegs" 
		puts "-"*33
		@score = @black_peg

		victory if @score == 4
		
	end

	def compare_codes(guess_code,code)
		match_array = []
		code.each_with_index do |color,idx|
			if color == guess_code[idx]
				@black_peg += 1
				match_array << color
			elsif code.include?(guess_code[idx])
				if match_array.include?(guess_code[idx])
					@white_peg += 0
				else
					@white_peg += 1
				end
			else
				@white_peg += 0
			end
		end
	end

	def select_code
		puts "Choose 4 from: #{@color_codes.join(",")}"
		puts " "*33		
		i = 1

		while i <= 4 
			puts "Enter choice no.#{i}"
			puts " "*33
			choice = gets.chomp.upcase	
			if @color_codes.include?(choice) 
				@guess_code << choice
				i += 1
				puts "-"*33
				puts "Your choices are #{@guess_code.join(",")}"
				puts "-"*33
			else
				puts "Please enter a valid input"
			end
		end
		@user_code = @guess_code
	end

	def victory
		puts "You have won the game!!"
		puts "="*33
		new_game?
	end

	def lose
		puts "You Lost!!! The secret code was #{@code.join(",")}"
		new_game?
	end

	def new_game?
		puts "New Game? Y/N"
		choice = gets.chomp.upcase
		if choice == "Y"
			game = Mastermind.new
			game.start
		elsif choice == "N"
			exit
		else
			puts "Enter a valid input!"	
			new_game?
		end
	end

	def get_user_code(code)
		@code = code
	end

	def auto_generate_code
		4.times { @code << @color_codes[rand(0..5)] }
		@code
	end

end

game = Mastermind.new
game.start






