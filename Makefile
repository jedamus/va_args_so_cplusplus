# erzeugt Samstag, 04. Juli 2015 14:04 (C) 2015 von Leander Jedamus
# modifiziert Montag, 07. Oktober 2024 19:13 von Leander Jedamus
# modifiziert Sonntag, 01. September 2024 09:12 von Leander Jedamus
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

# set link_switch to shared, if there is at least one shared library:
link_switch		:= static# shared

lib1_switch		:= static# shared
lib2_switch		:= shared# static

DEPENDFILE		:= .depend
PRINTFILE		:= .print

DATE			:= $(shell date +\"%y%m%d\")
DATETIME		:= $(shell date +\"%d.%m.%Y\ %H:%M\")
PROJECT			:= $(shell cat project.txt)
# PROJECT		:= va_args_so_c++
PROJECT_FILES		:= version.hh project.hh

PREFIX			:= /usr/local
BINDIR			:= $(PREFIX)/bin
LIBDIR			:= $(PREFIX)/lib
DATADIR			:= $(PREFIX)/share
LOCALEDIR		:= $(DATADIR)/locale

BACKUPDIR		:= $(PROJECT)
TARFILE			:= $(BACKUPDIR).tar.gz
ZIPFILE			:= $(BACKUPDIR)_$(DATE).zip
MAKEFILE		:= Makefile

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
# DFLAGS			+= -DCLRSCR
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
CPPFLAGS		+= # -funroll.olops -fomit-frame-pointer
CXXFLAGS		+= # -felide-constructors -fmemoize.olokups
LDFLAGS			+= -L .# -s

ifneq ($(link_switch),static)
  ifeq ($(CC),clang)
    LDFLAGS    		+= -L $(shell pwd) -Xlinker -rpath -Xlinker $(shell pwd)
  else
    LDFLAGS		+= -Wl,--rpath=$(shell pwd)
  endif
endif
#LDFLAGS		+= --rpath=$(shell pwd) # for other compilers
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
CPPDEPENDS		:= # here you add the .d files make from .cc files
IS_IN_LIB		:= # no.olnger needed
SHARED_LIBS		:= # here you add all shared libraries
CPPSOURCES		:= # put your c++ source files here. File types \
			    "*.cc,*.cpp,*.c++,*.cxx,*.C" are recognized. \
			    (will be used e.g. by "make depend")
FILES			:= # put your source and other files here, that you \
                            want to be used e.g. in "make backup" and \
			    "make print"

FILES			+= Makefile.in
FILES			+= Makefile.c_and_c++
FILES			+= create_Makefile.sh
FILES			+= run_me_once.sh
FILES			+= depend.sh
FILES			+= translate.sh
FILES			+= backup.sh
FILES			+= distclean.sh
FILES			+= zip.sh
FILES			+= create_project.sh
FILES			+= create_version.sh
FILES			+= install_bin.sh install_lib.sh install_locale.sh
FILES			+= bin_dist.sh
FILES			+= project.txt
FILES			+= version.txt
FILES			+= author.txt author_email.txt license.txt
FILES			+= maintainer.txt maintainer_email.txt
FILES			+= updated.txt url.txt description.txt years.txt

# Library 1:

LIB1CPPFILES		:= min.cc max.cc
CPPSOURCES		+= $(LIB1CPPFILES)
LIB1DEPENDS		:= $(LIB1CPPFILES:%.cc=%.d)
FILES			+= $(LIB1CPPFILES)
LIB1HFILES		:= types.hh minmax.hh gettext.hh clrscr.hh macros.hh
LIB1HFILES		+= $(LIB1CPPFILES:%.cc=%.hh)
FILES			+= $(LIB1HFILES)
FILES			+= $(LIB1CPPFILES2)
LIB1DEPENDS		+= $(LIB1CPPFILES2:%.cc=%.d)
FILES			+= $(LIB1CPPFILES2:%.cc=%.hh)

# uncomment following 4 lines and add your cpp-files here, which don't have a corresponding header file:
# LIB1CPPFILES3		:= no_header.cc
# CPPSOURCES		+= $(LIB1CPPFILES3)
# LIB1DEPENDS		+= $(LIB1CPPFILES3:%.cc=%.d)
# FILES			+= $(LIB1CPPFILES3)

CPPDEPENDS		+= $(LIB1DEPENDS)
LIB1RARYNAME		:= subs_so_cxx
LIB1OBJ			:= lib$(LIB1RARYNAME).o

LOADLIBES		:= -l$(LIB1RARYNAME)

ifeq ($(lib1_switch),static)
  LIB1RARY2		:= lib$(LIB1RARYNAME).so
  LIB1RARIES2		:= $(LIB1RARY2)
  LIB1OBJNAM1		:= $(LIB1CPPFILES:%.cc=%.osl) $(LIB1CPPFILES2:%.cc=%.osl) $(LIB1CPPFILES3:%.cc=%.osl)
  LIB1OBJS1		:= $(LIB1OBJNAM1)
  OBJSLIB1		:= $(LIB1OBJS1)
  LIB1RARY		:= lib$(LIB1RARYNAME).a
  LIB1RARIES		:= $(LIB1RARY)
  LIB1OBJNAM2           := $(LIB1CPPFILES:%.cc=%.ol) $(LIB1CPPFILES2:%.cc=%.ol) $(LIB1CPPFILES3:%.cc=%.ol)
  LIB1OBJS12		:= $(LIB1OBJNAM2)
  LIB1OBJS		:= $(LIB1OBJS12)
  OBJSLIB12		:= $(LIB1OBJS12)
  OBJS			+= $(OBJSLIB1) $(OBJSLIB12)
  LIBRARIES		+= $(LIB1RARY) $(LIB1RARY2)
else
  LIB1RARY2		:= lib$(LIB1RARYNAME).a
  LIB1RARIES2		:= $(LIB1RARY2)
  LIB1OBJNAM1		:= $(LIB1CPPFILES:%.cc=%.ol) $(LIB1CPPFILES2:%.cc=%.ol) $(LIB1CPPFILES3:%.cc=%.ol)
  LIB1OBJS1		:= $(LIB1OBJNAM1)
  OBJSLIB1		:= $(LIB1OBJS1)
  LIB1RARY		:= lib$(LIB1RARYNAME).so
  LIB1RARIES		:= $(LIB1RARY)
  LIB1OBJNAM2		:= $(LIB1CPPFILES:%.cc=%.osl) $(LIB1CPPFILES3:%.cc=%.osl)
  LIB1OBJS13		:= $(LIB1CPPFILES2:%.cc=%.osl)
  LIB1OBJS12		:= $(LIB1OBJNAM2)
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
  OBJSLIB12		:= $(LIB1OBJS12)
  OBJS			+= $(OBJSLIB12) $(OBJSLIB1) $(LIB1OBJS13)
  LIBRARIES		+= $(LIB1RARY2) $(LIB1RARY)
  SHARED_LIBS		+= $(LIB1RARY)
endif

# Library 2:

LIB2CPPFILES		:= getlocaledir.cc

ifeq ($(machtype),Linux)
  LIB2CPPFILES2		:= getch.cc
endif
ifeq ($(machtype),Arm)
  LIB2CPPFILES2		:= getch.cc
endif
ifeq ($(machtype),MacOS)
  LIB2CPPFILES2		:= getch.cc
endif

CPPSOURCES		+= $(LIB2CPPFILES)
LIB2DEPENDS		:= $(LIB2CPPFILES:%.cc=%.d) $(LIB2CPPFILES2:%.cc=%.d) 
FILES			+= $(LIB2CPPFILES)
LIB2HFILES		+= $(LIB2CPPFILES:%.cc=%.hh)
FILES			+= $(LIB2HFILES)
CPPSOURCES		+= $(LIB2CPPFILES2)
FILES			+= $(LIB2CPPFILES2)
FILES			+= $(LIB2CPPFILES2:%.cc=%.hh)

# uncomment fo.olwing 4 lines and add your cpp-files here, which don't have a corresponding header file:
# LIB2CPPFILES3		:= no_header.cc
# CPPSOURCES		+= $(LIB2CPPFILES3)
# 	LIB2DEPENDS		+= $(LIB2CPPFILES3:%.cc=%.d)
# FILES				+= $(LIB2CPPFILES3)

CPPDEPENDS		+= $(LIB2DEPENDS)
LIB2RARYNAME		:= subs_so_cxx2
LIB2OBJ			:= lib$(LIB2RARYNAME).o

LOADLIBES		+= -l$(LIB2RARYNAME)

ifeq ($(lib2_switch),static)
  LIB2RARY2		:= lib$(LIB2RARYNAME).so
  LIB2RARIES2		:= $(LIB2RARY2)
  LIB2OBJNAM1		:= $(LIB2CPPFILES:%.cc=%.osl) $(LIB2CPPFILES2:%.cc=%.osl) $(LIB2CPPFILES3:%.cc=%.osl)
  LIB2OBJS1		:= $(LIB2OBJNAM1)
  OBJSLIB2		:= $(LIB2OBJS1)
  LIB2RARY		:= lib$(LIB2RARYNAME).a
  LIB2RARIES		:= $(LIB2RARY)
  LIB2OBJS12		:= $(LIB2CPPFILES:%.cc=%.ol) 
  LIB2OBJNAM2           := $(LIB2CPPFILES2:%.cc=%.ol) $(LIB2CPPFILES3:%.cc=%.ol)
  LIB2OBJS13		:= $(LIB2OBJNAM2)
  LIB2OBJS		:= $(LIB2OBJS12)
  LIB2OBJS		+= $(LIB2OBJS13)
  OBJSLIB22		:= $(LIB2OBJS12)
  OBJS			+= $(OBJSLIB2) $(OBJSLIB22) $(LIB2OBJS13)
  LIBRARIES		+= $(LIB2RARY) $(LIB2RARY2)
else
  LIB2RARY2		:= lib$(LIB2RARYNAME).a
  LIB2RARIES2		:= $(LIB2RARY2)
  LIB2OBJNAM1		:= $(LIB2CPPFILES:%.cc=%.ol) $(LIB2CPPFILES2:%.cc=%.ol) $(LIB2CPPFILES3:%.cc=%.ol)
  LIB2OBJS1		:= $(LIB2OBJNAM1)
  OBJSLIB2		:= $(LIB2OBJS1)
  LIB2RARY		:= lib$(LIB2RARYNAME).so
  LIB2RARIES		:= $(LIB2RARY)
  LIB2OBJS12		:= $(LIB2CPPFILES:%.cc=%.osl)
  LIB2OBJNAM2		:= $(LIB2CPPFILES2:%.cc=%.osl) $(LIB2CPPFILES3:%.cc=%.osl)
  LIB2OBJS13		:= $(LIB2OBJNAM2)
  LIB2OBJS		:= $(LIB2OBJS12)
  LIB2OBJS		+= $(LIB2OBJS13)
  OBJSLIB22		:= $(LIB2OBJS12)
  OBJS			+= $(OBJSLIB22) $(OBJSLIB2) $(LIB2OBJS13)
  LIBRARIES		+= $(LIB2RARY2) $(LIB2RARY)
  SHARED_LIBS		+= $(LIB2RARY)
endif

# Main:

CMAINFILE		:= main.cc
CPPSOURCES		+= $(CMAINFILE)
CPPDEPENDS		+= $(CMAINFILE:%.cc=%.d)
FILES			+= $(CMAINFILE)
MAINOBJS		:= $(CMAINFILE:%.cc=%.o)
OBJS			+= $(MAINOBJS)

CLEAN			= $(strip $(filter %.o,$(OBJS)) \
		            $(filter %.osl,$(OBJS)) \
		            $(filter %.ol,$(OBJS)) \
			    $(LIBRARIES) $(PROGRAMS) \
			   )

PROGRAM1		:= $(PROJECT)
#PROGRAM2		:= check

PROGRAMS		:= $(PROGRAM1) $(PROGRAM2)

.PHONY:			all
all:			$(PROJECT_FILES) $(PROGRAMS)
			@echo done.

.PHONY:			install
install:		$(PROJECT_FILES) $(PROGRAMS)
			@sh ./install_bin.sh $(BINDIR) $(PROGRAM1) $(PROGRAM2)
			@sh ./install_lib.sh $(LIBDIR) $(LIB2RARY)
			@sh ./install_locale.sh $(LOCALEDIR) $(PROJECT).mo

.PHONY:			bin_dist
bin_dist:		$(PROJECT_FILES) $(PROGRAMS)
			@sh ./bin_dist.sh $(PROGRAM1) $(PROJECT) $(SHARED_LIBS)
#			@sh ./bin_dist.sh $(PROGRAM2) $(PROJECT) $(SHARED_LIBS)

.PHONY:			strip
strip:			$(PROGRAMS)
			$(STRIP) $(PROGRAMS)

.PHONY:			debug
debug:
			@echo "$$""(CLEAN)=$(strip $(CLEAN))"
			@echo "$$""(OBJS)=$(strip $(OBJS))"
			@echo "$$""(FILES)=$(strip $(FILES))"
			@echo "$$""(CSOURCES)=$(strip $(CSOURCES))"
			@echo "$$""(CPPSOURCES)=$(strip $(CPPSOURCES))"
			@echo "$$""(CDEPENDS)=$(strip $(CDEPENDS))"
			@echo "$$""(CPPDEPENDS)=$(strip $(CPPDEPENDS))"
			@echo "$$""(OBJS1)=$(strip $(OBJS1))"
			@echo "$$""(OBJS12)=$(strip $(OBJS12))"
			@echo "$$""(PROGRAMS)=$(strip $(PROGRAMS))"
			@echo "$$""(LIB1OBJS)=$(strip $(LIB1OBJS))"
			@echo "$$""(LIB2OBJS)=$(strip $(LIB2OBJS))"
			@echo "$$""(IS_IN_LIB)=$(strip $(IS_IN_LIB))"
			@echo "$$""(SHARED_LIBS)=$(strip $(SHARED_LIBS))"
			@echo "$$""(PROGRAM1)=$(strip $(PROGRAM1))"


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

$(PROGRAM1):		$(CPPDEPENDS) $(LIB1RARY) $(LIB2RARY) $(MAINOBJS)
			$(link.cc)

#check:			$(CPPOBJS)
#			$(link.cc)

$(LIB1RARY):		$(LIB1OBJS)
ifeq ($(lib1_switch),static)
			$(static_library)
else
			$(dynamic_library.osl)
 endif

$(LIB2RARY):		$(LIB2OBJS)
ifeq ($(lib2_switch),static)
			$(static_library)
else
			$(dynamic_library.osl)
endif

.PHONY:			clean
clean:
			$(RM) -r $(CLEAN)
ifeq ($(machtype),MacOS)
			$(RM) -r check.dSYM
endif

.PHONY:			distclean
distclean:
			@./distclean.sh $(strip $(CDEPENDS) $(CPPDEPENDS) $(MAKEFILE) $(PRINTFILE) $(GMONFILE) $(PROFFILE) $(NMFILE) $(PROJECT_FILES) $(CLEAN))
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

project.hh:		project.txt author.txt author_email.txt license.txt maintainer.txt maintainer_email.txt url.txt description.txt years.txt create_project.sh
			@echo "creating $@"
			@./create_project.sh $@

version.hh:		version.txt author.txt updated.txt create_version.sh
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
#ifneq ($(strip $(CPPSOURCES)),)
#			$(DEPEND.cc) $(CPPSOURCES) >> $(DEPENDFILE)
#endif

.PHONY:			depend
depend:			$(CDEPENDS) $(CPPDEPENDS) ;

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
