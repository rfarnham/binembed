out/datagen: src/datagen.cc
	g++ src/datagen.cc -o out/datagen

out/data.bin: out/datagen
	cd out && ./datagen

out/xxd_data.h: out/data.bin
	cd out && xxd -i data.bin > xxd_data.h

out/data.o: src/data.S out/data.bin
	gcc -c src/data.S -o out/data.o

bin/xxduser: src/xxduser.cc out/xxd_data.h
	g++ src/xxduser.cc -Iout -o bin/xxduser

bin/externuser: src/externuser.cc out/data.o
	g++ src/externuser.cc out/data.o -o bin/externuser

clean: .PHONY
	rm out/* bin/* 2> /dev/null || true

all: bin/externuser bin/xxduser

runall: all
	bin/externuser && bin/xxduser

.PHONY:
