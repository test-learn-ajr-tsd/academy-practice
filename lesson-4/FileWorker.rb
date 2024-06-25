module FileWorker
	def self.index(filename)
		if File.exist?(filename)
			return File.read(filename)
		else
			return '[Файл не найден!]'
		end
	end

	def self.count_strings(filename)
		if File.exist?(filename)
			return File.readlines(filename).length			 
		else
			return '[Файл не найден!]'
		end
	end

	def self.find(filename, id)
		return '[Файл не найден!]' unless File.exist?(filename)
		return '[Некоректный номер строки]' if id < 0 || id >= self.count_strings(filename)

		File.foreach(filename).with_index do |line, index|
			return line.chomp if index == id
		end
	end

	def self.where(filename, pattern)
		if File.exist?(filename)
			strarr = []

			File.foreach(filename) do |line|
				strarr.push(line.chomp) if line.include?(pattern)
			end			
			return strarr
		else
			return '[Файл не найден!]'
		end
	end

	def self.update(fname_source, fname_buffer, id, text)
		return '[Файл не найден!]' if !File.exist?(fname_source)
		return '[Некоректный номер строки]' if id < 0 || id >= self.count_strings(fname_source)
		
		fdest = File.open(fname_buffer, 'w')
		File.foreach(fname_source).with_index do |line, index|
			fdest.puts(index == id ? text : line)
		end
		fdest.close
		File.write(fname_source, File.read(fdest))	
	end

	def self.delete(fname_source, fname_buffer, id)
		return '[Файл не найден!]' if !File.exist?(fname_source)
		return '[Некоректный номер строки]' if id < 0 || id >= self.count_strings(fname_source)
		
		fdest = File.open(fname_buffer, 'w')
		File.foreach(fname_source).with_index do |line, index|
			fdest.puts(index == id ? '' : line)
		end
		fdest.close
		File.write(fname_source, File.read(fdest))	
	end
	
	# согласно заданию, метод по добавлению в конце строки будет назван "append"
	def self.append(filename, text) 
		file = File.open(filename, 'a')
		file.puts(text)
		file.close
	end
end