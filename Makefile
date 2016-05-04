all: dist/Simple.html dist/Advanced.html build/.tested

dist/%.html: $(shell find src examples -type f -name '*.elm' -o -name '*.js') dist
	elm-make examples/$*/App.elm --yes --warn --output=$@

dist:
	@mkdir $@

build:
	@mkdir $@

build/.tested: build/tests.js build
	node $<

build/tests.js: build/raw-test.js build
	sh elm-stuff/packages/laszlopandy/elm-console/1.1.1/elm-io.sh $< $@

build/raw-test.js: $(shell find src examples test -type f -name '*.elm' -o -name '*.js') build
	elm-make test/Main.elm --yes --warn --output=$@
