# erzeugt Samstag, 04. Juli 2015 14:04 (C) 2015 von Leander Jedamus
# modifiziert Montag, 12. August 2024 09:42 von Leander Jedamus
# modifiziert Dienstag, 06. August 2024 15:13 von Leander Jedamus
# modifiziert Freitag, 23. Februar 2024 16:25 von Leander Jedamus
# modifiziert Donnerstag, 22. Februar 2024 10:17 von Leander Jedamus
# modifiziert Mittwoch, 15. November 2023 16:42 von Leander Jedamus
# modifiziert Dienstag, 07. November 2023 20:37 von Leander Jedamus
# modifiziert Montag, 02. Oktober 2023 06:18 von Leander Jedamus
# modifiziert Mittwoch, 20. September 2023 08:41 von Leander Jedamus
# modifiziert Dienstag, 19. September 2023 14:07 von Leander Jedamus
# modifiziert Samstag, 09. September 2023 11:21 von Leander Jedamus
# modifiziert Freitag, 08. September 2023 17:31 von Leander Jedamus
# modifiziert Dienstag, 05. September 2023 08:21 von Leander Jedamus
# modifiziert Samstag, 02. September 2023 11:16 von Leander Jedamus
# modifiziert Mittwoch, 30. August 2023 13:01 von Leander Jedamus
# modifiziert Donnerstag, 17. August 2023 07:34 von Leander Jedamus
# modifiziert Mittwoch, 16. August 2023 15:02 von Leander Jedamus
# modifiziert Dienstag, 15. August 2023 16:56 von Leander Jedamus
# modifiziert Mittwoch, 09. August 2023 15:01 von Leander Jedamus
# modifiziert Dienstag, 08. August 2023 21:44 von Leander Jedamus
# modifiziert Sonntag, 30. Juli 2023 19:25 von Leander Jedamus
# modifiziert Donnerstag, 27. Juli 2023 09:05 von Leander Jedamus
# modifiziert Mittwoch, 26. Juli 2023 08:28 von Leander Jedamus
# modifiziert Dienstag, 25. Juli 2023 16:21 von Leander Jedamus
# modifiziert Sonntag, 23. Juli 2023 13:53 von Leander Jedamus
# modifiziert Samstag, 22. Juli 2023 15:17 von Leander Jedamus
# modifiziert Freitag, 21. Juli 2023 10:42 von Leander Jedamus
# modifiziert Donnerstag, 20. Juli 2023 10:44 von Leander Jedamus
# modifiziert Mittwoch, 19. Juli 2023 20:10 von Leander Jedamus
# modifiziert Dienstag, 18. Juli 2023 08:03 von Leander Jedamus
# modifiziert Montag, 17. Juli 2023 22:18 von Leander Jedamus

SUFFIXES := .out .a .ln .o .c .cc .cpp .c++ .cxx .C .p .pas .f .F .for .f77 .f90 .f95 .f03 .f08 .m .r .y .l .ym .yl .s .S \
            .mod .sym .def .h .info .dvi .tex .texinfo .texi .txinfo .w .ch .web .sh .elc .el .latex .ps .nw .cweb .noweb \
	    .mf .ind .sgml .cob .1 .odt .html .pdf .ps .tfm
.SUFFIXES:  .out .a .ln .o .c .cc .cpp .c++ .cxx .C .p .pas .f .F .for .f77 .f90 .f95 .f03 .f08 .m .r .y .l .ym .yl .s .S \
            .mod .sym .def .h .info .dvi .tex .texinfo .texi .txinfo .w .ch .web .sh .elc .el .latex .ps .nw .cweb .noweb \
	    .mf .ind .sgml .cob .1 .odt .html .pdf .ps .tfm

.DEFAULT_GOAL		:= all

.INTERMEDIATE:		# list files here which should be treated as intermediate

.SECONDARY:		# list files here which are intermediate and should not be deleted

.PRECIOUS:		# %.o %.c for example to save intermediate files created by implicit rules

# .NOTPARALLEL:		

.DELETE_ON_ERROR:

debug_switch		:= true# false
link_switch		:= static

DEPENDFILE		:= .depend
PRINTFILE		:= .print

DATE			:= $(shell date +\"%y%m%d\")
DATETIME		:= $(shell date +\"%d.%m.%Y\ %H:%M\")
PROJECT			:= $(shell cat project.txt)
# PROJECT		:= va_args_so_c++
BACKUPDIR		:= $(PROJECT)
TARFILE			:= $(BACKUPDIR).tar.gz
ZIPFILE			:= $(BACKUPDIR)_$(DATE).zip

# profiling:
GMONFILE		:= gmon.out
PROFFILE		:= gprof.out.txt
NMFILE			:= nm.out.txt

STRIP			:= strip

include Makefile.c_and_c++

DEBUGGER		:= gdb
RM			:= rm -f
GENERATE		:= ./generate2
PRINT			:= a2ps
TOUCH			:= touch

LINT			:= cppcheck
PROF			:= gprof
NM			:= nm

CFLAGS			:= #
DFLAGS			:= #
LDFLAGS			:= #
LDLIBS			:= #
CPPFLAGS		:= #
CXXFLAGS		:= #
ARFLAGS			:= rv
NMFLAGS			:= --extern-only --defined-only -v --print-file-name
LINTFLAGS		:= #

ifeq ($(debug_switch),true)
  CPPFLAGS		+= -g -Wall
  ifeq ($(CC),gcc)
    CPPFLAGS		+= -pg # profiling
    CPPFLAGS		+= -Og # optimize for debug
  endif
else
  CPPFLAGS		+= -O3
endif

DFLAGS			+= -DINLINE=inline
#DFLAGS			+= -DINLINE
DFLAGS			+= -DCONST=const
#DFLAGS			+= -DCONST
DFLAGS			+= -DSYSTEM=$(machtype)
DFLAGS			+= -DCLRSCR
ifeq ($(DEBUG),true)
  DFLAGS		+= -DDEBUG=true
endif

ifeq ($(CC),gcc)
  CPPFLAGS		+= -ansi
endif

CPPFLAGS		+= -pipe

ifeq ($(machtype),MacOS)
  CPPFLAGS		+= -I/usr/local/Cellar/gettext/0.19.3/include
endif

CPPFLAGS		+= # -traditional
CPPFLAGS		+= # -funroll-loops -fomit-frame-pointer
CXXFLAGS		+= # -felide-constructors -fmemoize-lookups
LDFLAGS			+= -L .# -s

ifneq ($(link_switch),static)
  ifeq ($(CC),clang)
    LDFLAGS    		+= -L `pwd` -Xlinker -rpath -Xlinker `pwd`
  else
    LDFLAGS		+= -Wl,--rpath=$(shell echo `pwd`)
  endif
endif

#LDFLAGS		+= --rpath=$(shell echo `pwd`) # for other compilers
#LDFLAGS		+= --rpath=.
LDLIBS			+= -lm
# LDLIBS		+= -lefence
LDLIBS			+= # -lvga
LDLIBS			+= # -ly
LDLIBS			+= # -ltermcap
LDLIBS			+= -ll # lex
LDLIBS			+= -ly # yacc

ifeq ($(machtype),MacOS)
  LDFLAGS		+= -L /usr/local/lib
  LDLIBS		+= -lintl
endif

define debug
$(DEBUGGER) $<
endef

define generate
$(GENERATE) $<
endef

define print
$(PRINT) $<
endef

%.cc:			%.txt
			$(generate)

%.hh:			%.txt
			$(generate)

OBJS			:= # put your obj files here \
			    (will be deleted by "make clean")
LIBRARIES		:= # put your libraries here \
			    (will be deleted by "make clean")
CSOURCES		:= # put your c source files here \
			    (will be used e.g. by "make depend")
CDEPENDS		:= # here you add the .d files make from .c files
CCDEPENDS		:= # here you add the .d files make from .cc files
IS_IN_LIB		:= # here you add the .d files, which obj-files are in a library
CCSOURCES.*		:= # put your c++ source files here. File types \
			    "*.cc,*.cpp,*.c++,*.cxx,*.C" are recognized. \
			    (will be used e.g. by "make depend")
FILES			:= # put your source and other files here, that you \
                            want to be used e.g. in "make backup" and \
			    "make print"

FILES			+= Makefile
FILES			+= Makefile.c_and_c++
FILES			+= run_me_once.sh
FILES			+= depend.sh
FILES			+= translate.sh
FILES			+= backup.sh
FILES			+= distclean.sh
FILES			+= zip.sh
FILES			+= create_project.sh
FILES			+= create_version.sh
FILES			+= project.txt project.hh
FILES			+= version.txt version.hh
FILES			+= author.txt email.txt years.txt

# use this for your c++ source files (uncomment for use with your c++-file):
#CCSOURCES.cc		:= #
#CCSOURCES.cpp		:= #
#CCSOURCES.c++		:= #
#CCSOURCES.cxx		:= #
#CCSOURCES.C		:= #

#CCOBJS.cc		:= #
#CCOBJS.cpp		:= #
#CCOBJS.c++		:= #
#CCOBJS.cxx		:= #
#CCOBJS.C		:= #

#CCSOURCES.cc		+= check1.cc
#CCSOURCES.cpp		+= check2.cpp
#CCSOURCES.c++		+= check3.c++
#CCSOURCES.cxx		+= check4.cxx
#CCSOURCES.C		+= check5.C

#CCOBJS.cc		+= $(CCSOURCES.cc:%.cc=%.o)
#CCOBJS.cpp		+= $(CCSOURCES.cpp:%.cpp=%.o)
#CCOBJS.c++		+= $(CCSOURCES.c++:%.c++=%.o)
#CCOBJS.cxx		+= $(CCSOURCES.cxx:%.cxx=%.o)
#CCOBJS.C		+= $(CCSOURCES.C:%.C=%.o)

# you have to uncomment these, if you use c++:
#CCSOURCES		+= $(CCSOURCES.cc) $(CCSOURCES.cpp) $(CCSOURCES.c++) \
			   $(CCSOURCES.cxx) $(CCSOURCES.C)
#FILES			+= $(CCSOURCES.cc) $(CCSOURCES.cpp) $(CCSOURCES.c++) \
			   $(CCSOURCES.cxx) $(CCSOURCES.C)
#CCOBJS			+= $(CCOBJS.cc) $(CCOBJS.cpp) $(CCOBJS.c++) \
			   $(CCOBJS.cxx) $(CCOBJS.C)
#OBJS			+= $(CCOBJS)

CLIB1FILES		:= min.cc max.cc getlocaledir.cc
CLIB1FILES2		:= getch.cc
CCSOURCES		+= $(CLIB1FILES)
CCDEPENDS		+= $(CLIB1FILES:%.cc=%.d)
ifeq ($(machtype),Linux)
  CCSOURCES		+= $(CLIB1FILES2)
  CCDEPENDS		+= $(CLIB1FILES2:%.cc=%.d)
endif 
ifeq ($(machtype),Arm)
  CCSOURCES		+= $(CLIB1FILES2)
  CCDEPENDS		+= $(CLIB1FILES2:%.cc=%.d)
endif 
ifeq ($(machtype),MacOS)
  CCSOURCES		+= $(CLIB1FILES2)
  CCDEPENDS		+= $(CLIB1FILES2:%.cc=%.d)
endif 
FILES			+= $(CLIB1FILES)
HLIB1FILES		:= types.hh minmax.hh gettext.hh clrscr.hh macros.hh
HLIB1FILES		+= $(CLIB1FILES:%.cc=%.hh)
FILES			+= $(HLIB1FILES)
FILES			+= $(CLIB1FILES2)
FILES			+= $(CLIB1FILES2:%.cc=%.hh)
LIBRARY1NAME		:= subs
LIB1OBJ			:= lib$(LIBRARY1NAME).o

LOADLIBES		:= -l$(LIBRARY1NAME)
IS_IN_LIB		:= $(CLIB1FILES:%.cc=%.d)

ifeq ($(link_switch),static)
  LIBRARY12		:= lib$(LIBRARY1NAME).so
  LIBRARIES12		:= $(LIBRARY12)
  LIB1OBJS1		:= $(CLIB1FILES:%.cc=%.o++)
  LIB1OBJS1		+= $(CLIB1FILES2:%.cc=%.o++)
  OBJS1			:= $(LIB1OBJS1)
  LIBRARY1		:= lib$(LIBRARY1NAME).a
  LIBRARIES1		:= $(LIBRARY1)
  LIB1OBJS12		:= $(CLIB1FILES:%.cc=%.oo)
  LIB1OBJS13		:= $(CLIB1FILES2:%.cc=%.oo)
  LIB1OBJS		:= $(LIB1OBJS12)
ifeq ($(machtype),Linux)
  LIB1OBJS		+= $(LIB1OBJS13)
endif
ifeq ($(machtype),Arm)
  LIB1OBJS		+= $(LIB1OBJS13)
endif
ifeq ($(machtype),MacOS)
  LIB1OBJS		+= $(LIB1OBJS13)
endif
  OBJS12		:= $(LIB1OBJS12)
  OBJS			+= $(OBJS1) $(OBJS12) $(LIB1OBJS13)
  LIBRARIES		+= $(LIBRARY1) $(LIBRARY12)
else
  LIBRARY12		:= lib$(LIBRARY1NAME).a
  LIBRARIES12		:= $(LIBRARY12)
  LIB1OBJS1		:= $(CLIB1FILES:%.cc=%.oo)
  LIB1OBJS1		+= $(CLIB1FILES2:%.cc=%.oo)
  OBJS1			:= $(LIB1OBJS1)
  LIBRARY1		:= lib$(LIBRARY1NAME).so
  LIBRARIES1		:= $(LIBRARY1)
  LIB1OBJS12		:= $(CLIB1FILES:%.cc=%.o++)
  LIB1OBJS13		+= $(CLIB1FILES2:%.cc=%.o++)
  LIB1OBJS		:= $(LIB1OBJS12)
ifeq ($(machtype),Linux)
  LIB1OBJS		+= $(LIB1OBJS13)
endif
ifeq ($(machtype),Arm)
  LIB1OBJS		+= $(LIB1OBJS13)
endif
ifeq ($(machtype),MacOS)
  LIB1OBJS		+= $(LIB1OBJS13)
endif
  OBJS12		:= $(LIB1OBJS12)
  OBJS			+= $(OBJS12) $(OBJS1) $(LIB1OBJS13)
  LIBRARIES		+= $(LIBRARY12) $(LIBRARY1)
endif

CMAINFILE		:= main.cc
CCSOURCES		+= $(CMAINFILE)
CCDEPENDS		+= $(CMAINFILE:%.cc=%.d)
FILES			+= $(CMAINFILE)
MAINOBJS		:= $(CMAINFILE:%.cc=%.o)
OBJS			+= $(MAINOBJS)

CLEAN			= $(strip $(filter %.o,$(OBJS)) \
		            $(filter %.o++,$(OBJS)) \
		            $(filter %.oo,$(OBJS)) \
			    $(LIBRARIES) $(PROGRAMS) \
			   )

PROGRAM1		:= $(PROJECT)
#PROGRAM2		:= check

PROGRAMS		:= $(PROGRAM1) $(PROGRAM2)

.PHONY:			all
all::			$(PROGRAMS)
			@echo done.

.PHONY:			strip
strip:			$(PROGRAMS)
			$(STRIP) $(PROGRAMS)

.PHONY:			debug
debug:
			@echo "$$""(CLEAN)=$(strip $(CLEAN))"
			@echo "$$""(OBJS)=$(strip $(OBJS))"
			@echo "$$""(FILES)=$(strip $(FILES))"
			@echo "$$""(CSOURCES)=$(strip $(CSOURCES))"
			@echo "$$""(CCSOURCES)=$(strip $(CCSOURCES))"
			@echo "$$""(CDEPENDS)=$(strip $(CDEPENDS))"
			@echo "$$""(CCDEPENDS)=$(strip $(CCDEPENDS))"
			@echo "$$""(OBJS1)=$(strip $(OBJS1))"
			@echo "$$""(OBJS12)=$(strip $(OBJS12))"
			@echo "$$""(PROGRAMS)=$(strip $(PROGRAMS))"
			@echo "$$""(LIB1OBJS)=$(strip $(LIB1OBJS))"

.PHONY:			debugger
debugger:		$(PROGRAM1)
			$(debug)

.PHONY:			lint
lint:
			$(LINT) $(LINTFLAGS) .

.PHONY:			prof
prof:			$(PROGRAM1)
			$(PROGRAM1)
			$(PROF) $(PROGRAM1) $(GMONFILE) > $(PROFFILE)
			$(NM) $(NMFLAGS) $(PROGRAM1) > $(NMFILE)

$(PROGRAM1):		$(CCDEPENDS) $(LIBRARY1) $(MAINOBJS)
			$(link.cc)

#check:			$(CCOBJS)
#			$(link.cc)

$(LIBRARY1):		$(LIB1OBJS)
ifeq ($(link_switch),static)
			$(archive)
else
			$(dynamic_link.o++)
endif

.PHONY:			clean
clean:
			$(RM) -r $(CLEAN)
ifeq ($(machtype),MacOS)
			$(RM) -r check.dSYM
endif

.PHONY:			distclean
distclean:
			@./distclean.sh $(strip $(CDEPENDS) $(CCDEPENDS) $(PRINTFILE) $(GMONFILE) $(PROFFILE) $(NMFILE) $(CLEAN))
ifeq ($(machtype),MacOS)
			$(RM) -r check.dSYM
endif

.PHONY:			print
print:			$(PRINTFILE)

$(PRINTFILE):		$(FILES)
			$(PRINT) $?
			$(TOUCH) $(PRINTFILE)

.PHONY:			dummy
dummy:

project.hh:		project.txt
			@echo "creating $@"
			@./create_project.sh $@

version.hh:		version.txt
			@echo "creating $@"
			@./create_version.sh $@

.PHONY:			create_project
create_project:		project.hh version.hh

.PHONY:			update_version
update_version:		version.hh

#.PHONY:			depend
#depend:
#			echo "# automatically created" \
#			     "$(shell date +\"%d.%m.%Y\ %H:%M\")" \
#			     "by \"make depend\"" > $(DEPENDFILE)
#ifneq ($(strip $(CSOURCES)),)
#			$(DEPEND.c) $(CSOURCES) >> $(DEPENDFILE)
#endif
#ifneq ($(strip $(CCSOURCES)),)
#			$(DEPEND.cc) $(CCSOURCES) >> $(DEPENDFILE)
#endif

.PHONY:			depend
depend:			$(CDEPENDS) $(CCDEPENDS) ;

.PHONY:			backup
backup:
			@./backup.sh $(BACKUPDIR) $(TARFILE) $(strip $(FILES))

.PHONY:			zip
zip:
			@./zip.sh $(BACKUPDIR) $(ZIPFILE) $(strip $(FILES))

.PHONY:			translate
translate:
			@./translate.sh

#
# include a dependency file if one exists
#
#ifeq ($(DEPENDFILE),$(wildcard $(DEPENDFILE)))
#  include $(DEPENDFILE)
#endif

#
# include dependency files if exists
#
ifneq (,$(wildcard *.d))
  include *.d
endif

# vim:ai sw=2 noexpandtab

