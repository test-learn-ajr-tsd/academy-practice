def обработкаСлова(слово)
	return nil if !слово.is_a?(String)
	return '2^' + (слово.size).to_s + ' = ' + (2**слово.size).to_s if слово.end_with?('CS')
	return слово.reverse
end

# puts 'Введите слово: '
# слово = gets.chomp
# puts обработкаСлова(слово)