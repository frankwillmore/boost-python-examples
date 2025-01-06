#include <boost/python.hpp>
#include <iostream>

using namespace boost::python;

struct Greeter{
    Greeter(){}
    void greetWorld() {std::cout << "Hello fool\n";}
};

BOOST_PYTHON_MODULE(helloo) {
    class_<Greeter>("Greeter", init())
        .def("greet_world", &Greeter::greetWorld) ;
}

