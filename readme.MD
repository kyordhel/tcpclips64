# `tcpCLIPS64`: A Server/Client CLIPS 6.4.1 wrapper using TCP sockets.
This repo allows you to connect CLIPS 6.4.1 (version of 4/8/23) with anything supporting sockets.
This CLIPS solution is purely written in C and includes no patches, fixes, or anything.
The Server is written in C++14.

# QuickStart

This guide assumes that you faithfully run Linux and have installed compilers and stuff.


## Step 0: Install dependencies
```
# apt install build-essential cmake libboost-all-dev libncurses-dev
```

Notice that old distros like Ubuntu 18.04 might also need `libncursesw5-dev`.


## Step 1: Download and build
1. Clone this repo somewhere. I did choose `develop` in my home folder.
```
mkdir -p ~/develop
cd develop
git clone https://github.com/kyordhel/tcpclips60.git
```

2. Build the source (it may take a while)
```
cd tcpclips64/build
cmake .. && make
cd ..
```


## Step 2: Test it
Simply go to the root of the repo and run `start.sh`:
```
./start.sh
```

Things start to move now.
Just follow the instruction on the test node.
