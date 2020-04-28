# Define the directories
MAIN = main_autocode
GENERIC_INC_DIR := ../std_autocode_headers/
INC_DIR := ./$(MAIN)/
BUILD_DIR := ./$(MAIN)/build
SRC_DIR := ./$(MAIN)

# Define macros for all file names of the files we care about
SRC := $(wildcard $(SRC_DIR)/*.c)
OBJ := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRC))
# if there are libraries to include, add them to the line below and then add $(LIBS) to the main: rule.
# LIBS := 

# Macros for build options
CC=gcc
CFLAGS=-I$(GENERIC_INC_DIR) -I$(INC_DIR) -w -Wall
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	CFLAGS += -lm
endif

main: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) 

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) -c -o $@ $< $(CFLAGS)




.PHONY: clean
clean:
	rm -f $(BUILD_DIR)/*.o $(BUILD_DIR)/*.d *~ cor