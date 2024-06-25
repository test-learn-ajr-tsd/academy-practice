require_relative 'FileWorker.rb'
def student_writer(fname_source, age, fname_dest)
	return '[Файл не найден!!!]' unless File.exist?(fname_source)
	return 'Некоректный возраст' unless age.is_a?(Numeric) && age >= 0

	students_with_age = FileWorker.where(fname_source, age.to_s)
	fdest = File.open(fname_dest, 'a')
	if students_with_age.empty?
		fdest.puts('Студентов  возраста ' + age.to_s + ' лет НЕТ!!!')
	else
		fdest.puts('Студенты с возрастом ' + age.to_s + ' лет:')
		students_with_age.each do |item|
			fdest.puts(item)
		end
	end	
	fdest.close
end