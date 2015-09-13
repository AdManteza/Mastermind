class Mastermind

	

	def initialize
		@guess = []
		@code = []
		@victory = false
		@grey_pegs = 0
		@black_pegs = 0
		
	end

	

	def start

		puts "Choose to play as: "
		puts "1 - Codemaker"
		puts "2 - Codebreaker"
		puts "Press 1 or 2"

		user_choice = gets.chomp

		if user_choice == "1"
			Codemaker.new
			
		elsif user_choice == "2"
			Codebreaker.new
			
		else
			puts "Press only 1 or 2"
			start
		end
		
		

	end


end

class Codemaker

	def initialize
		puts "Codemaker"
	end

end

class Codebreaker

	@@color_codes = ["R", "G", "B", "Y", "O", "P"]

	def initialize
		puts "Codebreaker"
		@code = []
		generate_code
	end

	def generate_code
		4.times { @code << @@color_codes[rand(0..5)]}
		puts @code
	end

end

game = Mastermind.new
game.start



#"R = 1" "G = 2" "B = 3" "Y = 4" "O = 5" "P = 6"

