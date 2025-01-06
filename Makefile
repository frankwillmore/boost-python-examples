wrapper: wrapper.cc
	g++ -fPIC -c wrapper.cc 
	g++ -Wl,-soname,wrapper -shared wrapper.o -o wrapper.so -lboost_python312 -lpython3.12

helloo: helloo.cc
#	g++ helloo.cc -fPIC -Wl,-soname,helloo -shared -o helloo.so -lboost_python312 -lpython3.12
	g++ helloo.cc -fPIC -shared -o helloo.so -lboost_python312 -lpython3.12

clean:
	rm -rf *.o *.so

test:
	python -c "import helloo; helloo.Greeter().greet_world()"
