CC=clang
CFLAGS=-emit-llvm -g $(OPTIMIZE) --target=wasm32 -c -m32 $(INCLUDES) $(WARN)
LD=wasm-ld

LIB_DIR=lib
BUG_LIB_DIR=lib-with-bugs
UTILS_DIR=for-wasp/utils
MOCKS_DIR=for-wasp/mockups
NORMAL_TESTS=for-wasp/normal
BUG_TESTS=for-wasp/bugs
BUILD_DIR=_build
OPTIMIZE ?= -O0

# Includes
INCLUDES += -I$(MOCKS_DIR)
INCLUDES += -I$(UTILS_DIR)

# Warnings
WARN += -Wno-incompatible-library-redeclaration
WARN += -Wno-incompatible-pointer-types
WARN += -Wno-implicit-function-declaration
WARN += -Wno-return-type
WARN += -Wno-int-conversion
WARN += -Wno-pointer-integer-compare

# Sources
lib   := $(wildcard $(LIB_DIR)/*.c)
libbc := $(addprefix $(BUILD_DIR)/,$(lib:.c=.bc))
libo  := $(addprefix $(BUILD_DIR)/,$(lib:.c=.o))

libbug   := $(wildcard $(BUG_LIB_DIR)/*.c)
libbugbc := $(addprefix $(BUILD_DIR)/,$(libbug:.c=.bc))
libbugo  := $(addprefix $(BUILD_DIR)/,$(libbug:.c=.o))

tests   := $(wildcard $(NORMAL_TESTS)/**/*.c)
testsbc := $(addprefix $(BUILD_DIR)/,$(tests:.c=.bc))
testso  := $(addprefix $(BUILD_DIR)/,$(tests:.c=.o))

testbugs   := $(wildcard $(BUG_TESTS)/*.c)
testbugsbc := $(addprefix $(BUILD_DIR)/,$(testbugs:.c=.bc))
testbugso  := $(addprefix $(BUILD_DIR)/,$(testbugs:.c=.o))

.PHONY: clean

.SECONDARY: $(libo) $(libbugo)

default: all

all: $(testso:.o=.wat) $(testbugso:.o=.wat)

# BUGS

$(BUILD_DIR)/lib-with-bugs/%.bc: lib-with-bugs/%.c
	@mkdir -p $(dir $@)
	@echo "Building $@"
	@echo "$(CC) $(CFLAGS) -I$(BUG_LIB_DIR)/include -o $@ $<"; $(CC) $(CFLAGS) -I$(BUG_LIB_DIR)/include -o $@ $<

$(BUILD_DIR)/for-wasp/bugs/%.bc: for-wasp/bugs/%.c
	@mkdir -p $(dir $@)
	@echo "Building $@"
	@echo "$(CC) $(CFLAGS) -I$(BUG_LIB_DIR)/include -o $@ $<"; $(CC) $(CFLAGS) -I$(BUG_LIB_DIR)/include -o $@ $<

$(BUILD_DIR)/for-wasp/bugs/%.wasm: $(BUILD_DIR)/for-wasp/bugs/%.o $(libbugo) $(BUILD_DIR)/for-wasp/utils/utils.o $(BUILD_DIR)/for-wasp/mockups/mockups.o
	@echo "Building $@"
	@$(LD) --no-entry --export=__original_main $^ -o $@

# NORMAL

$(BUILD_DIR)/for-wasp/normal/%.bc: for-wasp/normal/%.c
	@mkdir -p $(dir $@)
	@echo "Building $@"
	@echo "$(CC) $(CFLAGS) -I$(LIB_DIR)/include -o $@ $<"; $(CC) $(CFLAGS) -I$(LIB_DIR)/include -o $@ $<

$(BUILD_DIR)/for-wasp/normal/%.wasm: $(BUILD_DIR)/for-wasp/normal/%.o $(libo) $(BUILD_DIR)/for-wasp/utils/utils.o $(BUILD_DIR)/for-wasp/mockups/mockups.o
	@echo "Building $@"
	@$(LD) --no-entry --export=__original_main $^ -o $@

# GENERIC BUILD

$(BUILD_DIR)/%.bc: %.c
	@mkdir -p $(dir $@)
	@echo "Building $@"
	@echo "$(CC) $(CFLAGS) -I$(LIB_DIR)/include -o $@ $<"; $(CC) $(CFLAGS) -I$(LIB_DIR)/include -o $@ $<

$(BUILD_DIR)/%.o: $(BUILD_DIR)/%.bc
	@echo "Building $@"
	@opt -O1 $< -o $<
	@llc -O1 -march=wasm32 -filetype=obj $< -o $@

$(BUILD_DIR)/%.wat: $(BUILD_DIR)/%.wasm
	@echo "Building $@"
	@wasm2wat $^ -o $@
	@./patch.sh $@

# OTHER

$(BUILD_DIR)/for-wasp/utils/utils.bc: $(UTILS_DIR)/utils.c
	@mkdir -p $(dir $@)
	@echo "Building $@"
	@echo "$(CC) $(CFLAGS) -o $@ $^"; $(CC) $(CFLAGS) -o $@ $^

$(BUILD_DIR)/for-wasp/utils/utils.o: $(BUILD_DIR)/for-wasp/utils/utils.bc
	@echo "Building $@"
	@opt -O1 $< -o $<
	@llc -O1 -march=wasm32 -filetype=obj $< -o $@

$(BUILD_DIR)/for-wasp/mockups/mockups.bc: $(MOCKS_DIR)/mockups.c
	@mkdir -p $(dir $@)
	@echo "Building $@"
	@echo "$(CC) $(CFLAGS) -o $@ $^"; $(CC) $(CFLAGS) -o $@ $^

$(BUILD_DIR)/for-wasp/mockups/mockups.o: $(BUILD_DIR)/for-wasp/mockups/mockups.bc
	@echo "Building $@"
	@opt -O1 $< -o $<
	@llc -O1 -march=wasm32 -filetype=obj $< -o $@

clean:
	@echo "rm -rf $(BUILD_DIR)"; rm -rf $(BUILD_DIR)