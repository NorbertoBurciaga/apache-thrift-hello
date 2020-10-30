CPP_DEFS   =-D=HAVE_NETINET_IN_H
CPP_OPTS   =-Wall -O2 -std=c++11
LIBS       =-lthrift

GEN_SRC    = ./gen-cpp/Hello.cpp
GEN_INC    = -I./gen-cpp

default: server

server: Hello_server.cpp
	g++ ${CPP_OPTS} ${CPP_DEFS} -o hello_server ${GEN_INC} ${INCS_DIRS} Hello_server.cpp ${GEN_SRC} ${LIBS_DIRS} ${LIBS}

clean:
	$(RM) -r hello_server
