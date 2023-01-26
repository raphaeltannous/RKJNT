OBJS = src/RKJNT_main.o \
       src/RKJNT_match.o \
       src/RKJNT_ref.o \
       src/RKJNT_render.o \
       src/intset.o \
       src/strutil.o \
       data/RKJNT_data.o
CFLAGS += -Wall -Isrc/
LDLIBS += -lreadline

RKJNT: $(OBJS)
	$(CC) -o $@ $(LDFLAGS) $(OBJS) $(LDLIBS)

src/RKJNT_main.o: src/RKJNT_main.c src/RKJNT_config.h src/RKJNT_data.h src/RKJNT_match.h src/RKJNT_ref.h src/RKJNT_render.h src/strutil.h

src/RKJNT_match.o: src/RKJNT_match.h src/RKJNT_match.c src/RKJNT_config.h src/RKJNT_data.h src/RKJNT_ref.h

src/RKJNT_ref.o: src/RKJNT_ref.h src/RKJNT_ref.c src/intset.h src/RKJNT_data.h

src/RKJNT_render.o: src/RKJNT_render.h src/RKJNT_render.c src/RKJNT_config.h src/RKJNT_data.h src/RKJNT_match.h src/RKJNT_ref.h

src/insetset.o: src/intset.h src/insetset.c

src/strutil.o: src/strutil.h src/strutil.c

data/RKJNT_data.o: src/RKJNT_data.h data/RKJNT_data.c

data/RKJNT_data.c: data/RKJNT.tsv data/generate.awk src/RKJNT_data.h
	awk -f data/generate.awk $< > $@

.PHONY: clean
clean:
	rm -rf $(OBJS) RKJNT
