all: dist/Simple.html dist/Advanced.html tests.js

dist/%.html: $(shell find src examples -type f -name '*.elm' -o -name '*.js') dist
	elm-make examples/$*/App.elm --yes --warn --output=$@

dist:
	@mkdir $@

tests.js: FORCE $(shell find src -type f -name '*.elm' -o -name '*.js')
	elm-make --yes --warn
	@$(MAKE) -C test

FORCE:
