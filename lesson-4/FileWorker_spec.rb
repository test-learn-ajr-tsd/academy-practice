require 'rspec'
require_relative 'FileWorker.rb'

RSpec.describe 'Тесты для функции обработки функции по работе с файлами' do 
  let(:тестстрока) { File.read('test_data.txt') } 
  let(:тестстрокаУдалениеСтроки) do
    <<-тестстрокаУдалениеСтроки
А ссылками на следующие домашние задания – будут ссылки на пул-реквесты:
Переходим на main
Ветвимся от нее в lesson-1
Создаем папку lesson-1
Внутри нее создаем нужные файлы, работаем
Коммитим сделанное
Пушим lesson-1 на гитхаб
Оформляем пул-реквест

Ждем обратную связь от кураторов
Когда кураторы одобряют – мержим пул-реквест
Подтягиваем обновленную ветку main на ваш компьютер
Пул-реквесты важно оформлять, чтобы кураторы могли прямо там, общими комментариями или комментариями к конкретным строчкам в вашем коде, оставлять вам обратную связь
    тестстрокаУдалениеСтроки
  end

  let(:тестстрокаДляОбновления) do
    <<-тестстрокаДляОбновления
А ссылками на следующие домашние задания – будут ссылки на пул-реквесты:
Переходим на main
Ветвимся от нее в lesson-1
Создаем папку lesson-1
Внутри нее создаем нужные файлы, работаем
Коммитим сделанное
Пушим lesson-1 на гитхаб
Оформляем пул-реквест
Ссылку на пул-реквест присылаем
Ждем обратную связь от кураторов
Радуемся жизни!
Подтягиваем обновленную ветку main на ваш компьютер
Пул-реквесты важно оформлять, чтобы кураторы могли прямо там, общими комментариями или комментариями к конкретным строчкам в вашем коде, оставлять вам обратную связь
    тестстрокаДляОбновления
  end

	it 'Прочитать содержимое файла' do 
		expect(FileWorker.index('test_data.txt')).to eq тестстрока		
	end	

	it 'Проверить длину файла' do 
		expect(FileWorker.count_strings('test_data.txt')).to eq 13
	end	

	it 'Найти 11 строку в файле"' do 
		expect(FileWorker.find('test_data.txt', 11)).to eq тестстрока.split("\n")[11]
	end

	it 'Попытка найти строку > имеющегося количества' do 
		expect(FileWorker.find('test_data.txt', 200)).to eq '[Некоректный номер строки]'
	end	

	it 'Попытка найти строку "отрицательную строку"' do 
		expect(FileWorker.find('test_data.txt', -2)).to eq '[Некоректный номер строки]'
	end	

	it 'Вернуть строки, где есть элемент "lesson-1"' do 
		expect(FileWorker.where('test_data.txt', 'lesson-1')).to eq ['Ветвимся от нее в lesson-1', 'Создаем папку lesson-1', 'Пушим lesson-1 на гитхаб']		
	end	

	it 'Вернуть пустой массив, при попытке поиска несуществующей строки' do 
		expect(FileWorker.where('test_data.txt', 'город')).to eq []		
	end	

	before { File.write('test_for_rewrite.txt', тестстрока) }
	it 'Тест - удаление строки с файла' do 
		FileWorker.delete('test_for_rewrite.txt', 'buffer.txt', 8)
		expect(FileWorker.index('test_for_rewrite.txt')).to eq тестстрокаУдалениеСтроки
	end

	it 'Попытка удалить строку > количества строк' do 
		expect(FileWorker.delete('test_for_rewrite.txt', 'buffer.txt', 200)).to eq '[Некоректный номер строки]'
	end

	before { File.write('test_for_rewrite.txt', тестстрока) }
	it 'Тест - обновление строки с файла' do 
		FileWorker.update('test_for_rewrite.txt', 'buffer.txt', 10, 'Радуемся жизни!')
		expect(FileWorker.index('test_for_rewrite.txt')).to eq тестстрокаДляОбновления		
	end

	before { File.write('test_for_rewrite.txt', тестстрока) }
	it 'Тест - добавление строки с файла' do 
		FileWorker.append('test_for_rewrite.txt', 'НЕ забываем улучшать алгоритмы!!!')
		expect(FileWorker.index('test_for_rewrite.txt')).to eq тестстрока + "НЕ забываем улучшать алгоритмы!!!\n"		
	end

	it 'Тесты на отсутствие имени файла' do 
		expect(FileWorker.index('I-am-not.txt')).to eq '[Файл не найден!]'
		expect(FileWorker.count_strings('I-am-not.txt')).to eq '[Файл не найден!]'
		expect(FileWorker.find('I-am-not.txt', 11)).to eq '[Файл не найден!]'
		expect(FileWorker.where('I-am-not.txt', 'lesson-1')).to eq '[Файл не найден!]'
		expect(FileWorker.update('I-am-not.txt', 'buffer.txt', 10, 'Радуемся жизни!')).to eq '[Файл не найден!]'
		expect(FileWorker.delete('I-am-not.txt', 'buffer.txt', 8)).to eq '[Файл не найден!]'		
	end
end