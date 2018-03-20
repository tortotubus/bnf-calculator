all: calculator

calculator.tab.c calculator.tab.h: calculator.y
	bison -d calculator.y

lex.yy.c: calculator.l calculator.tab.h
	flex calculator.l

calculator: lex.yy.c calculator.tab.c calculator.tab.h
	gcc -o calculator calculator.tab.c lex.yy.c

clean:
	rm calculator calculator.tab.c lex.yy.c calculator.tab.h
