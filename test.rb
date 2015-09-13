#def compare
	code = ["W", "R", "BR", "Y"]

	guess = ["W", "R", "BR", "Y"]

	#matching color only
	gray_peg = 0

	#matching color and position
	black_peg = 0

	code.each_with_index do |color,idx|
		if color == guess[idx]
			black_peg += 1
		elsif guess.include?(color)
			gray_peg += 1
		end

	end
#end

puts "Gray Peg = #{gray_peg}"
puts "Black Peg = #{black_peg}"


#def evaluate(guess)
	
	#puts "Enter guess combination"
	#compare(guess)


#end

def get_guess
	
end




