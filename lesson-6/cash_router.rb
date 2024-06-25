require_relative 'CashMachine.rb'

def маршрутизацияДляCashMachine(путь, параметры = {})
	cash_machine = CashMachine.new
	return case путь
	when '/'
		параметры = {}
		File.read('explanation.txt')
	when '/deposit'
		if параметры['value'].nil?
			'Параметр не корректно передан!'
		else
			сумма = параметры['value'].to_f

			if сумма <= 0
				'Сумма не может быть <= 0!'
			else		
				cash_machine.увеличитьБаланс(сумма)
				cash_machine.записатьБаланс
				'Команда успешно выполнена!'
			end
		end

	when '/withdraw'
		if параметры['value'].nil?
			'Параметр не корректно передан!'
		else
			сумма = параметры['value'].to_f

			if сумма <= 0
				'Сумма не может быть <= 0!'
			elsif сумма > cash_machine.баланс
				'Сумма не может быть больше вашего баланса!'
			else		
				cash_machine.уменьшитьБаланс(сумма)
				cash_machine.записатьБаланс
				'Команда успешно выполнена!'
			end
		end
				
	when '/balance'
		'Ваш баланс: ' + cash_machine.баланс.to_s
	else
		'404'
	end
end