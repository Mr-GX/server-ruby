#ruby 库

def output_file_data(pattern,filename)
	file=File.open(filename)
	file.each_line do |line_data|
		if pattern =~ line_data.force_encoding("UTF-8")
			print(line_data)
		end
	end
	file.close
end