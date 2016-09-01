#symbol(符号是轻量级的字符串，散列（map）作为key更高效),string转换测试

sym=:test
string="test"
p(sym.to_s,string.to_sym)