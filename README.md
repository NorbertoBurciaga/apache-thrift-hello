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
sudo apt install git-all gcc g++ flex bison make cmake autoconf automake libtool autotools-dev libevent-dev zlib1g-dev pkg-config libssl-dev npm python-all python-all-dev python-all-dbg python3-all python3-all-dev python3-all-dbg valgrind curl
```

#### Install Boost
```console
Download latest version from: https://dl.bintray.com/boostorg/release/
$ wget https://dl.bintray.com/boostorg/release/1.69.0/source/boost_1_69_0.tar.gz
$ tar xvf boost_1_69_0.tar.gz
$ cd boost_1_69_0/
boost_1_69_0$ sudo ./bootstrap.sh --prefix=/usr/local
Set the use of MPI
boost_1_69_0$ user_configFile=`find $PWD -name user-config.jam`
boost_1_69_0$ echo $user_configFile
boost_1_69_0/tools/build/example/user-config.jam
boost_1_69_0$ echo "using mpi;" >> $user_configFile
boost_1_69_0$ sudo ./b2 install
```

#### Install Apache Thrift
```console
$ git clone https://github.com/apache/thrift.git
$ ./bootstrap.sh
$ ./configure --with-boost=/usr/local --without-ruby
$ make
$ make -k check
```

#### Install project
```console
$ git clone https://github.com/NorbertoBurciaga/apache-thrift-hello.git
$ cd apache-thrift-hello/src
$ thrift --gen cpp hello.thrift
$ make
```

### Testing

To test:
First check $export LD_LIBRARY_PATH=/usr/local/lib environment variable is set
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

