STACK ?= stack
SITE := $(STACK) exec site

.PHONY: all compile recompile build watch clean clean-stack

all: compile build

compile:
	$(STACK) build

recompile: clean-stack compile

build:
	$(SITE) build

watch:
	$(SITE) watch

clean:
	$(SITE) clean

clean-stack:
	$(STACK) clean
