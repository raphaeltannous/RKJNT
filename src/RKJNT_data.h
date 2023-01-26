#pragma once

typedef struct {
    int number;
    char *name;
    char *abbr;
} RKJNT_book;

typedef struct {
    int book;
    int chapter;
    int verse;
    char *text;
} RKJNT_verse;

extern RKJNT_verse RKJNT_verses[];

extern int RKJNT_verses_length;

extern RKJNT_book RKJNT_books[];

extern int RKJNT_books_length;
