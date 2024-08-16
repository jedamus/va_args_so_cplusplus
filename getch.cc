/* -*- C -*- */
/* getch.cc */
/* erzeugt Donnerstag, 07. September 2023 16:05 (C) 2023 von Leander Jedamus */
// modifiziert Freitag, 08. September 2023 17:24 von Leander Jedamus
/* modifiziert Donnerstag, 07. September 2023 16:20 von Leander Jedamus */

#include <stdio.h>
#include <stdlib.h>
#include <termios.h>
#include <unistd.h>
#include "getch.hh"

static struct termios new_io;
static struct termios old_io;

int cbreak(int fd) {
  if ((tcgetattr(fd, &old_io)) == -1)
    return -1;
  new_io = old_io;
  new_io.c_lflag = new_io.c_lflag & ~(ECHO|ICANON);
  new_io.c_cc[VMIN] = 1;
  new_io.c_cc[VTIME] = 0;

  if ((tcsetattr(fd, TCSAFLUSH, &new_io)) == -1)
    return -1;
  return 1;
}

int getch(void) {
  int c;

  if (cbreak(STDIN_FILENO) == -1) {
    printf("Fehler bei der Funktion cbreak ...\n");
    exit(EXIT_FAILURE);
  }
  c = getchar();
  tcsetattr(STDIN_FILENO, TCSANOW, &old_io);
  return c;
}

/* vim:set cindent ai sw=2: */

