unfold: unfold.c
	g++ unfold.c -o unfold

test: unfold
	g++ unfold.c -o unfold -g -DDEBUG
	@echo "test1, rust style sourcecode with mod /trait blocks.."
	grep -rn "baz" . --include "*.rs" | ./unfold 
	@echo "\ntest2, c source,default"
	grep -rn "is_whitespace" . --include "*.c" | ./unfold 
	@echo "\n Show Filenames"
	grep -rn "is_whitespace" . --include "*.c" | ./unfold -F
	@echo "\nSingle Line, no unfold"
	grep -rn "is_whitespace" . --include "*.c" | ./unfold -Su
	@echo "\nno filenames:-"
	grep -rn "is_whitespace" . --include "*.c" | ./unfold -f
	@echo "\nno filenames,singleline:-"
	grep -rn "is_whitespace" . --include "*.c" | ./unfold -fSu


valgrind:
	g++ unfold.c -o unfold -g -O0 -DDEBUG

install: unfold
	chmod +x scripts/*
	cp unfold /usr/local/bin

install-gedit:
	cp scripts/rust.lang ~/.local/share/gtksourceview-3.0/language-specs/rust.lang

