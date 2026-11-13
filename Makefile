##
# Site Build
#
# @file
# @version 0.1

all:
	cd my-site && stack build && stack exec site clean && stack exec site build && cd -

watch-v:
	cd my-site && stack build && stack exec site watch && cd -

# Run the watcher with all output discarded, e.g. `make watch &`
# (use `make watch-v` to see output)
watch:
	@$(MAKE) -s watch-v > /dev/null 2>&1 < /dev/null

# end
