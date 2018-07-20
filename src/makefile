THRIFT_VER =thrift-0.11.0
USR_DIR    =${HOME}/Downloads
THRIFT_DIR =${USR_DIR}/${THRIFT_VER}
INCS_DIRS  =-I/usr/local/include/boost -I${THRIFT_DIR}/lib/cpp/src/thrift
LIBS_DIRS  =-L/usr/local/lib -L${USR_DIR}/${THRIFT_VER}/lib/cpp
#CPP_DEFS   =-D=HAVE_CONFIG_H
CPP_DEFS   =-D=HAVE_NETINET_IN_H
CPP_OPTS   =-Wall -O2 -std=c++0x
LIBS       =-lthrift

GEN_SRC    = ./gen-cpp/Hello.cpp  \
             ./gen-cpp/hello_types.cpp   \
             ./gen-cpp/hello_constants.cpp
GEN_INC    = -I./gen-cpp

default: server

server: Hello_server.cpp
	g++ ${CPP_OPTS} ${CPP_DEFS} -o hello_server ${GEN_INC} ${INCS_DIRS} Hello_server.cpp ${GEN_SRC} ${LIBS_DIRS} ${LIBS}

clean:
	$(RM) -r hello_server
