BINARY := xdg-desktop-portal-wlr
BUILD_DIR := build
PREFIX := /usr
MESON_FLAGS := --reconfigure --prefix=$(PREFIX) --libexecdir=lib

all: build

build:
	@meson setup $(BUILD_DIR) $(MESON_FLAGS)
	@ninja -C $(BUILD_DIR)

install: build
	@ninja -C $(BUILD_DIR) install

uninstall:
	@ninja -C $(BUILD_DIR) uninstall

run: build
	@./$(BUILD_DIR)/$(BINARY) -r --loglevel=TRACE

clean:
	@ninja -C build clean

check:
	@ninja -C build test

.PHONY: build clean install uninstall run
