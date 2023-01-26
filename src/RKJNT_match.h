#pragma once

#include "RKJNT_config.h"
#include "RKJNT_ref.h"

typedef struct {
    int start;
    int end;
} RKJNT_range;

typedef struct {
    int current;
    int next_match;
    RKJNT_range matches[2];
} RKJNT_next_data;

int
RKJNT_next_verse(const RKJNT_ref *ref, const RKJNT_config *config, RKJNT_next_data *next);
