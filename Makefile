BINPATH=node_modules/.bin
BROWSERIFY=$(BINPATH)/browserify
BROWSERIFY_FLAGS=
UGLIFY=$(BINPATH)/uglifyjs
UGLIFY_FLAGS=-cm --stats
JASMINE_NODE=$(BINPATH)/jasmine-node

OUTPUTPATH=dist

build: $(OUTPUTPATH) test
	$(BROWSERIFY) $(BROWSERIFY_FLAGS) -o $(OUTPUTPATH)/i18n.js i18n.js
	$(UGLIFY) $(UGLIFY_FLAGS) $(OUTPUTPATH)/i18n.js > $(OUTPUTPATH)/i18n.min.js

test:
	$(JASMINE_NODE) spec/

$(OUTPUTPATH):
	mkdir -p $(OUTPUTPATH)

clean:
	rm -rf $(OUTPUTPATH)
