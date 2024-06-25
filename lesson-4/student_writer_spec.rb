require 'rspec'
require_relative 'student_writer.rb'
require_relative 'FileWorker.rb'

RSpec.describe 'Тесты: перенос информацию о студентов в другой файл' do 
	let(:стрПровСтудента35) do 
		<<-стрПровСтудента35
Студенты с возрастом 35 лет:
Петр Сидоров 35
Александр Зайцев 35
Иван Иванов 35
		стрПровСтудента35
	end

let(:стрНЕТСтудента) do 
		<<-стрНЕТСтудента
Студенты с возрастом 35 лет:
Петр Сидоров 35
Александр Зайцев 35
Иван Иванов 35
		стрНЕТСтудента
	end

	before { File.write('results.txt', '') }
	it 'Перенос студентов' do 
		student_writer('students.txt', 35, 'results.txt')
		expect(File.read('results.txt')).to eq(стрПровСтудента35)	
	end

	before { File.write('results.txt', '') }
	it 'Случай отсутствия студента в списке' do 
		student_writer('students.txt', 32, 'results.txt')
		expect(File.read('results.txt')).to eq("Студентов  возраста 32 лет НЕТ!!!\n")	
	end		
end