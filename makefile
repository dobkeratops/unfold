unfold: unfold.c
	g++ unfold.c -o unfold

test: unfold
	grep -rn "baz" . --include "*.rs" | ./unfold 

install: unfold
	cp unfold /usr/local/bin
