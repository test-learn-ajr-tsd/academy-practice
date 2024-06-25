require_relative 'CashMachine.rb'

cash_machine = CashMachine.new

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
				cash_machine.увеличитьБаланс(сумма)
			end
		
		when 'W'
			puts 'Введите сумму: '
			сумма = gets.chomp.to_f

			if сумма <= 0
				puts 'Сумма не может быть <= 0!'
			elsif сумма > cash_machine.баланс
				puts 'Сумма не может быть больше вашего баланса!'
			else		
				cash_machine.уменьшитьБаланс(сумма)
			end
		when 'B'
			puts 'Ваш баланс: ' + cash_machine.баланс.to_s
		when 'Q'
			cash_machine.записатьБаланс
			break
		else
			puts 'Неизвестная команда'	
		end
	end

