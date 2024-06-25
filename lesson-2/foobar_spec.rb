require 'rspec'
require_relative 'foobar.rb'

RSpec.describe 'Using a func "foobar"' do 
	it 'Print numbers sum' do 
		expect(foobar(17,19)).to eq 36		
	end	

	it 'Print second number when first number is 20' do 
		expect(foobar(20,4)).to eq 4		
	end	

	it 'Print second number (20) when second number is 20' do 
		expect(foobar(6,20)).to eq 20		
	end	
end