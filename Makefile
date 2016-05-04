all: dist/index.html build/.tested

dist/main.css: $(shell find styles -type f -name '*.less')
	lessc styles/main.less $@

dist/index.html: $(shell find src example -type f -name '*.elm' -o -name '*.js') dist
	elm-make example/App.elm --yes --warn --output=$@

dist:
	@mkdir $@

build:
	@mkdir $@

build/.tested: build/tests.js build
	node $<

build/tests.js: build/raw-test.js build
	sh elm-stuff/packages/laszlopandy/elm-console/1.1.1/elm-io.sh $< $@

build/raw-test.js: $(shell find src example test -type f -name '*.elm' -o -name '*.js') build
	elm-make test/Main.elm --yes --warn --output=$@
