def guess
	guess_code = []
	base_code = ["R", "G", "B", "Y", "O", "P"]
	puts "Choose 4 colors from: #{base_code}"
	
	i = 1

	while i <= 4 

		puts "Enter choice no.#{i}"

		choice = gets.chomp.upcase
		
		if base_code.include?(choice) 
			guess_code << choice
			i += 1
		else
			puts "Please enter a valid input"
		end

	end

	guess_code
end

puts guess