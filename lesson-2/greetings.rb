def greetings
	first_name = ''; last_name = ''; age = 0 
	puts 'Введите имя: '
	first_name = gets.chomp until first_name != ''
	puts 'Введите фамилию: '
	last_name = gets.chomp until last_name != ''
	puts 'Введите возраст: ' 
	age = gets.chomp.to_i until age > 0

	greeting_str = 'Привет, ' + first_name + ' ' + last_name + '. '
	return greeting_str + 'Тебе меньше 18 лет, но начать учиться программировать никогда не рано!' if age < 18
	return greeting_str + 'Самое время заняться делом!' if age >= 18
end

#puts greetings