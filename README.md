# va args so c++

![GitHub Downloads (specific asset, all releases)](https://img.shields.io/github/downloads/jedamus/va_args_so_cplusplus/va_args_so_cplusplus?label=Total%20Downloads&style=for-the-badge)

![GitHub Downloads (all assets, all releases)](https://img.shields.io/github/downloads/jedamus/va_args_so_cplusplus/total?label=Total%20Downloads&style=for-the-badge)

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