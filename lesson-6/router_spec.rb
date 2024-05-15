require 'socket'
require_relative 'cash_router.rb'
#require_relative 'CashMachine.rb'

# Тестирование класса 'CashMachine' произведено при выполнения 
# домашнего задания по теме "Классы и модули" 

RSpec.describe 'Тест маршрутизаций' do
	#cash_machine = CashMachine.new

	it 'Тест - корень' do		
		expect(маршрутизацияДляCashMachine('/')).to eq File.read('explanation.txt')
	end
	
	File.write('balance.txt', '100.0')
	
	it 'Тест - /balance (до изменения)' do		
		expect(маршрутизацияДляCashMachine('/balance')).to eq 'Ваш баланс: 100.0'
	end

	it 'Тест - /withdraw' do		
		expect(маршрутизацияДляCashMachine('/withdraw', {"value"=>"20"})).to eq 'Команда успешно выполнена!'
	end

	it 'Тест - /balance (после изменения)' do		
		expect(маршрутизацияДляCashMachine('/balance')).to eq 'Ваш баланс: 80.0'
	end

	it 'Тест - /withdraw (с суммой больше баланса)' do		
		expect(маршрутизацияДляCashMachine('/withdraw', {"value"=>"200"})).to eq 'Сумма не может быть больше вашего баланса!'
	end	
end