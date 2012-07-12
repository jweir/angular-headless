FILES=./test/lib/*.coffee

test:
	@NODE_ENV=test \
	./node_modules/.bin/mocha \
	  -t 3500\
		--reporter min\
		--require should\
		--compilers coffee:coffee-script\
		$(FILES)

.PHONY: test 
