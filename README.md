# va args so c++

This is a template program in C++ using shared libraries written using Makefiles

## Getting started

```
sh create_Makefile.sh cc hh
sh run_me_once.sh
```

If you want to see no?header.cc in Makefile.in, then uncomment the corresponding 4 lines in the library you choose and do the following:

```
touch no_header.cc
sh create_Makefile.sh cc hh
make
```