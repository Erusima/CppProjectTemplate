CFLAGS := -Wall
INCLUDE :=
LIBS :=
CC := g++

SRC_DIR := src
OBJ_DIR := obj
SRC_FILES := $(wildcard $(SRC_DIR)/*.cpp)
OBJ_FILES := $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRC_FILES))
PROG_FILE := program

$(PROG_FILE): $(OBJ_FILES)
	$(CC) $(CFLAGS) $(OBJ_FILES) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c -o $@ $<

all: $(PROG_FILE)

clean:
	rm $(OBJ_DIR)/*
	rm $(PROG_FILE)

.PHONY: all clean
