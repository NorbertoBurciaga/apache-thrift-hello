# apache-thrift-hello

## Contents

* [Introduction](#introduction)
* [Project Hierarchy](#project-hierarchy)
* [Getting Started](#getting-started)
* [Support](#support)
* [FAQ](#faq)
* [Development](#development)
* [License](#license)
* [References](#references)

## Introduction

Simple Hello world example to test Apache Thrift with HTTP transport and JSON protocol.

[Contents](#contents)

## Project Hierarchy

```console
.
├── README.md
└── src
    ├── curlMessage.sh
    ├── curlPing.sh
    ├── gen-cpp
    │   ├── hello_constants.cpp
    │   ├── hello_constants.h
    │   ├── Hello.cpp
    │   ├── Hello.h
    │   ├── Hello_server.skeleton.cpp
    │   ├── hello_types.cpp
    │   └── hello_types.h
    ├── Hello_server.cpp
    ├── hello.thrift
    └── makefile
```

[Contents](#contents)

## Getting Started

### Requirements
* Make
* Boost
* Apache Thrift

### Installation

#### Installing some packages required
```console
sudo apt install git-all gcc g++ flex bison make cmake autoconf automake libtool autotools-dev libevent-dev zlib1g-dev pkg-config libssl-dev npm python-all python-all-dev python-all-dbg python3-all python3-all-dev python3-all-dbg valgrind
```

#### Install Boost
```console
$ cd Downloads
$ wget https://dl.bintray.com/boostorg/release/1.67.0/source/boost_1_67_0.tar.gz
$ tar xvf boost_1_67_0.tar.gz
$ cd boost_1_67_0/
$ sudo ./bootstrap.sh --prefix=/usr/local
Set the use of MPI
$ user_configFile=`find $PWD -name user-config.jam`
$ echo $user_configFile
/home/norberto/Downloads/boost_1_67_0/tools/build/example/user-config.jam
$ echo "using mpi;" >> $user_configFile
$ sudo ./b2 install
```

#### Install Apache Thrift
```console
$ git clone https://github.com/apache/thrift.git
$ ./bootstrap.sh
$ ./configure --with-boost=/usr/local
$ make
it sends a ruby error:
/usr/local/bin/rake:23:in `load': cannot load such file -- /usr/share/rubygems-integration/all/specifications/exe/rake (LoadError)

but removing rake as follows could work:
$ sudo rm /usr/share/rubygems-integration/all/specifications/rake-12.3.1.gemspec
$ make check
I had to do this again: $ pip install backports.ssl_match_hostname because of a phyton error: install backports.ssl_match_hostname...see https://github.com/ipython/ipython/issues/5911
$ sudo make install
$ sudo
```

#### Install project
```console
$ git clone https://github.com/NorbertoBurciaga/apache-thrift-hello.git
$ cd apache-thrift-hello/src
$ make
```

### Testing

To test:
Start the server in a new process (adding an & at the end of the command)
```console
apache-thrift-hello/src$  ./hello_server &
[2] 3692
```
After the server is running, send an http message using curl
```console
apache-thrift-hello/src$ curl -X POST -i http://localhost:9090 --data '[1,"message",1,1,{"1":{"str":"World!"}}]'
```
Or you can execute the curlMessage.sh that has the same example as the previous curl:
```console
apache-thrift-hello/src$ ./curlMessage.sh
```

A ping can also be tested executing the curlPing.sh
```console
apache-thrift-hello/src$ ./curlPing.sh
```
After you finish you can terminate the hello_server by killing the process, look for the process Id displayed when launch and execute the following:
```console
$ kill -9 3692
```
Note in this case is 3692, look for your pid.

### Documentation

[Contents](#contents)

## Support
Technical support is available in 

[Contents](#contents)

## FAQ

[Contents](#contents)

## Development
If you want to contribute....

[Contents](#contents)

## License

Copyright (c) 2018, Respective Authors all rights reserved.

The MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

[Contents](#contents)

## References


[Contents](#contents)

