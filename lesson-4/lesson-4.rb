require_relative 'FileWorker.rb'
require_relative 'student_writer.rb'

# puts FileWorker.index('test_data.txt')
# puts
# puts FileWorker.where('test_data.txt', 'lesson-1').to_s
# puts FileWorker.where('test_data.txt', 'пул-реквест').to_s
# puts
# FileWorker.delete('test_for_rewrite.txt', 'buffer.txt', 8)
# puts FileWorker.index('test_for_rewrite.txt')
# puts
# FileWorker.update('test_for_rewrite.txt', 'buffer.txt', 10, 'Радуемся жизни!')
# puts FileWorker.index('test_for_rewrite.txt')
# puts
# FileWorker.append('test_for_rewrite.txt', 'НЕ забываем улучшать алгоритмы!!!')
# puts FileWorker.index('test_for_rewrite.txt')
# puts; puts '---------------------'; puts;

age = -1;

until age == 0 || File.read('students.txt') == ''
	puts 'Введите возраст (Для выхода из программы наберите 0): '
	age = gets.chomp.to_i
	student_writer('students.txt', age, 'results.txt') if age > 0
end
puts 'Содержимое файла: '
puts File.read('results.txt')