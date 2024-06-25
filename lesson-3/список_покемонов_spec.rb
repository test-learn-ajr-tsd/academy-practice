require 'rspec'
require_relative 'список_покемонов.rb'

RSpec.describe 'Получение покемонов' do 
	it 'Вернуть покемонов' do
		# Т.к. ввод осущ. в теле функции при помощи цикла, как передать в тест?
		allow_any_instance_of(Kernel).to receive(:gets).and_return('2', 'Анна', 'Зеленый', 'Николай', 'Синий')		
		expect(список_покемонов).to eq [{"name"=>"Анна", "color"=>"Зеленый"}, {"name"=>"Николай", "color"=>"Синий"}]		
	end
end