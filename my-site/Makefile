STACK ?= stack
SITE := $(STACK) exec site

.PHONY: all compile recompile build watch watch-v clean clean-stack

all: compile build

compile:
	$(STACK) build

recompile: clean-stack compile

build:
	$(SITE) build

watch-v:
	$(SITE) watch

# Run the watcher with all output discarded, e.g. `make watch &`
# (use `make watch-v` to see output)
watch:
	@$(SITE) watch > /dev/null 2>&1 < /dev/null

clean:
	$(SITE) clean

clean-stack:
	$(STACK) clean
