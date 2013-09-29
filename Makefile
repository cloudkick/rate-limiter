CWD=`pwd`

test:
	node_modules/.bin/whiskey --tests "${CWD}/tests/test-rate-limiter.js"

.PHONY: test
