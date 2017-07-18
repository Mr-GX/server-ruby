class Test
	class Test1
		def method
			p 'hello nested class'
		end
	end
end

Test::Test1.new.method

module Demo
	module Demo1
		def self.method
			p 'hello nested module'
		end
	end
end

Demo::Demo1.method

module Demo
	class Test1
		def self.method
			p 'hello nested module class'
		end
	end
end

Demo::Test1.method

class Test
	module Demo1
		CL = 123
		def self.method
			p 'hello nested class module'
		end
	end
end

p Test::Demo1::CL
Test::Demo1.method
