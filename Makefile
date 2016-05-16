all: dist/Simple.html dist/Advanced.html dist/tests.js

dist/%.html: $(shell find src examples -type f -name '*.elm' -o -name '*.js') dist
	elm-make examples/$*/App.elm --yes --warn --output=$@

dist:
	@mkdir $@

build:
	@mkdir $@

dist/tests.js: FORCE $(shell find src test -type f -name '*.elm' -o -name '*.js')
	elm-make --yes --warn
	elm-make test/Main.elm --yes --warn --output=$@
	node $@

FORCE:
