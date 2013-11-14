all: clean FlamingoShhh.dylib

FlamingoShhh.dylib:
	clang -dynamiclib -o FlamingoShhh.dylib FlamingoShhh.m -framework Foundation

launch: FlamingoShhh.dylib
	sh -c "DYLD_INSERT_LIBRARIES='$(PWD)/FlamingoShhh.dylib' /Applications/Flamingo.app/Contents/MacOS/Flamingo"

clean:
	rm -f FlamingoShhh.dylib
