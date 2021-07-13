##
# Site Build
#
# @file
# @version 0.1

all:
	cd my-site && stack build && stack exec site clean && stack exec site build && cd -

watch:
	cd my-site && stack build && stack exec site watch && cd -

# end
