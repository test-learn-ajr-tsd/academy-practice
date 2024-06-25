require 'rspec'
require_relative 'greetings.rb'

RSpec.describe 'Using a func "foobar"' do 
	it 'Greeting when age >= 18' do 
		allow_any_instance_of(Kernel).to receive(:gets).and_return('Анна', 'Николаевна', '21')
		expect(greetings).to eq 'Привет, Анна Николаевна. Самое время заняться делом!'		
	end	

	it 'Greeting when age < 18' do 
		allow_any_instance_of(Kernel).to receive(:gets).and_return('Федор', 'Николаевич', '17')
		expect(greetings).to eq 'Привет, Федор Николаевич. Тебе меньше 18 лет, но начать учиться программировать никогда не рано!'		
	end
end