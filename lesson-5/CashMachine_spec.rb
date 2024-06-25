require 'rspec'
require_relative 'CashMachine.rb'

RSpec.describe 'Тест работы со классом CashMachine' do	
	before { File.delete('balance.txt') if File.exist?('balance.txt') }
	it 'Тест - инициализация' do 
		cash_machine = CashMachine.new
		expect(cash_machine.баланс).to eq 100.0
	end

	it 'Тест - инициализация с наличием файла баланса' do 
		cash_machine = CashMachine.new
		expect(cash_machine.баланс).to eq File.read('balance.txt').to_f #chomp.
	end

	cash_machine = CashMachine.new
	it 'Тест - увеличение баланса' do		
		cash_machine.увеличитьБаланс(20.0)
		expect(cash_machine.баланс).to eq 120.0
	end

	it 'Тест - уменьшение баланса' do 		
		cash_machine.уменьшитьБаланс(40.0)
		expect(cash_machine.баланс).to eq 80.0
	end
	
	it 'Тест - запись баланса' do			
		cash_machine.записатьБаланс
		expect(File.read('balance.txt').to_f).to eq 80.0
	end

	it 'Тест - попытка списать больше имеющегося баланса' do		
		cash_machine.уменьшитьБаланс(200.0)
		expect(cash_machine.баланс).to eq 80.0
	end

	it 'Тест - попытка списать "отрицательный" баланс' do		
		cash_machine.уменьшитьБаланс(-20.0)
		expect(cash_machine.баланс).to eq 80.0
	end

	it 'Тест - попытка списать "странный" баланс' do		
		cash_machine.уменьшитьБаланс('sffdsxcvxcv')
		expect(cash_machine.баланс).to eq 80.0
	end

	it 'Тест - попытка увеличить "отрицательный" баланс' do		
		cash_machine.увеличитьБаланс(-20.0)
		expect(cash_machine.баланс).to eq 80.0
	end

	it 'Тест - попытка увеличить "странный" баланс' do		
		cash_machine.увеличитьБаланс('sffdsxcvxcv')
		expect(cash_machine.баланс).to eq 80.0
	end
end

