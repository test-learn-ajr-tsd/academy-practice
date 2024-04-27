def greetings
	puts 'Введите имя: '
	first_name = gets.chomp
	puts 'Введите фамилию: '
	last_name = gets.chomp
	puts 'Введите возраст: ' 
	begin
		age = gets.chomp.to_i 	
	end	until age > 0	

	greeting_str = 'Привет, ' + first_name + ' ' + last_name + '. '
	return greeting_str + 'Тебе меньше 18 лет, но начать учиться программировать никогда не рано!' if age < 18
	return greeting_str + 'Самое время заняться делом!' if age >= 18
end

#puts greetings