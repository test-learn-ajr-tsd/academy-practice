class CashMachine
	attr_accessor :баланс

	def initialize
		unless File.exist?('balance.txt')
			@баланс = 100.0
			File.write('balance.txt', @баланс)
		else
			@баланс = (File.read('balance.txt')).to_f
		end		
	end

	def увеличитьБаланс(сумма)
		puts 'Сумма НЕ корректна!' unless сумма > 0
		return @баланс unless сумма > 0
		@баланс += сумма	
	end	
	
	def уменьшитьБаланс(сумма)
		puts 'Сумма НЕ корректна' if сумма <= 0
		puts 'Сумма больше текущего баланса' if сумма > @баланс
		return @баланс unless сумма > 0 && сумма <= баланс
		@баланс -= сумма
	end

	def записатьБаланс
		File.write('balance.txt', @баланс)
	end
end