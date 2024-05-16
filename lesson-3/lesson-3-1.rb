def обработка_слова(слово)
	слово.to_s
	return '2^' + (слово.size).to_s + ' = ' + (2**слово.size).to_s if слово.end_with?('CS')
	return слово.reverse
end

# puts 'Введите слово: '
# слово = gets.chomp
# puts обработкаСлова(слово)
