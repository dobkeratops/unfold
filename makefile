unfold: unfold.c
	g++ unfold.c -o unfold

test: unfold
	@echo "test1, rust style sourcecode with mod /trait blocks.."
	grep -rn "baz" . --include "*.rs" | ./unfold 
	@echo "test2, c source"
	grep -rn "is_whitespace" . --include "*.c" | ./unfold 

install: unfold
	cp unfold /usr/local/bin
