require 'rspec'
require_relative 'lesson-3-1.rb'

RSpec.describe 'Тесты для функции обработки слова' do 
	it 'Вернуть слово в реверсивном порядке' do 
		expect(обработкаСлова('JetRuby')).to eq 'ybuRteJ'		
	end	

	it 'Вывод степени, если в конце "CS"' do 
		expect(обработкаСлова('ТестCS')).to eq '2^6 = 64'		
	end	

	it 'Вернуть nil, если передана не строка!' do 
		expect(обработкаСлова(324)).to eq nil		
	end	
end