all: dist/app.js dist/index.html dist/main.css dist/interop.js build/.tested

dist/main.css: $(shell find styles -type f -name '*.less')
	lessc styles/main.less $@

dist/app.js: $(shell find src -type f -name '*.elm' -o -name '*.js') dist
	elm-make src/App.elm --yes --warn --output=$@

dist:
	@mkdir $@

dist/%.html: static/%.html dist
	cp $< $@

dist/%.js: static/%.js dist
	cp $< $@

dist/%.gif: static/%.gif dist
	cp $< $@

dist/%.png: static/%.png dist
	cp $< $@

dist/%.ico: static/%.ico dist
	cp $< $@

build:
	@mkdir $@

build/.tested: build/tests.js build
	node $<

build/tests.js: build/raw-test.js build
	sh elm-stuff/packages/laszlopandy/elm-console/1.1.1/elm-io.sh $< $@

build/raw-test.js: $(shell find src test -type f -name '*.elm' -o -name '*.js') build
	elm-make test/Main.elm --yes --warn --output=$@
