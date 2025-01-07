wrapper: wrapper.cc
	g++ -fPIC -c wrapper.cc 
	g++ -Wl,-soname,wrapper -shared wrapper.o -o wrapper.so -lboost_python312 -lpython3.12

hello: hello.cc
	g++ hello.cc -fPIC -shared -o hello.so -lboost_python312 -lpython3.12

helloo: helloo.cc
#	g++ helloo.cc -fPIC -Wl,-soname,helloo -shared -o helloo.so -lboost_python312 -lpython3.12
	g++ helloo.cc -fPIC -shared -o helloo.so -lboost_python312 -lpython3.12


# The prototype is working, where I'm bringing in the includes from the original source, and linking against the libvacuumms_cpp library for the implementation. Some environment stuff needs to be set up to make all this work, but this is what it needs to use, above. 
vacuumms: vacuumms.cc
#	g++ -fPIC parameters.cc -c -o parameters.o
	g++ -fPIC vacuumms.cc -c -o vacuumms.o 
#	g++ vacuumms.o parameters.o -shared -o vacuumms.so -lboost_python312 -lpython3.12
	g++ vacuumms.o -shared -o vacuumms.so -L/home1/fwillmor/VACUUMMS/build/libraries/ -lvacuumms_cpp -lboost_python312 -lpython3.12

clean:
	rm -rf *.o *.so

test:
	python -c "import helloo; helloo.Greeter().greet_world()"
