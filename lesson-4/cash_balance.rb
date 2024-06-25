def инициализировать
	unless File.exist?('balance.txt')
		баланс = 100.0
		File.write('balance.txt', баланс)
	else
		баланс = (File.read('balance.txt')).to_f
	end
	return баланс
end

def увеличитьБаланс(баланс, сумма)
	puts 'Сумма НЕ корректна!' unless сумма > 0
	return баланс unless сумма > 0
	return баланс + сумма	
end

def уменьшитьБаланс(баланс, сумма)
	puts 'Сумма НЕ корректна' if сумма <= 0
	puts 'Сумма больше текущего баланса' if сумма > баланс
	return баланс unless сумма > 0 && сумма <= баланс
	return баланс - сумма
end

баланс = инициализировать
while true	
	puts 'Команды: D (deposit) - увеличить баланс, W (withdraw) - уменьшить баланс, 
	B (balance) - показать текущий баланс, Q (quit) - выход из программы.'
	puts 'Введите команду: '
	команда = gets.chomp.upcase

	case команда
		when 'D'	
			puts 'Введите сумму: '
			сумма = gets.chomp.to_f

			if сумма <= 0
				puts 'Сумма не может быть <= 0!'
			else		
				баланс = увеличитьБаланс(баланс, сумма)
			end
		
		when 'W'
			puts 'Введите сумму: '
			сумма = gets.chomp.to_f

			if сумма <= 0
				puts 'Сумма не может быть <= 0!'
			elsif сумма > баланс
				puts 'Сумма не может быть больше вашего баланса!'
			else		
				баланс = уменьшитьБаланс(баланс, сумма)
			end
		when 'B'
			puts 'Ваш баланс: ' + баланс.to_s
		when 'Q'
			File.write('balance.txt', баланс)
			break
		else
			puts 'Неизвестная команда'	
		end
	end

