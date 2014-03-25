# Rate-limiter

Rate limiter enables IP address based rate limiting for HTTP(s) requests.

HTTP methods supported:  
`GET`  
`HEAD`  
`POST`  
`PUT`  
`DELETE`  
`ALL` - includes all the supported methods mentioned above

Rate limiter allows you to:  

* __Add a new limit for a given path and HTTP method:__       
 `var limiter = new RateLimiter();`  
 `limiter.addLimit('/test-path/', 'GET', 2, 500);`  
  where,    
 	'/test-path/' is the path  
        'GET' is the HTTP method the limit applies to  
	2 is the request count allowed per given period  
	500 is the time period for the request in seconds  

* __Remove Limit:__    
 `limiter.removeLimit('/test-path/', 'GET');`  
  where,     
	'/test-path/' is the path set on a limit  
        'GET' is the HTTP method associated with the path  

* __Reset IP address access counter for the given IP address:__    
 `limiter.resetIpAddressAccessCounter('/test-path', 'GET', '127.0.0.1');`  
  where,     
  	'/test-path/' is the path set on a limit  
        'GET' is the HTTP method associated with the path  
	'127.0.0.1' is the IP address for which the counter will be reset  

* __Process a request and execute callback if the limit is not reached, else drop the request:__    
 `var sampleReq = {'url': '/test-path/', 'method': 'GET', 'socket': {'remoteAddress': '127.0.0.1'}};`  
 `var sampleRes = {'writeHead': writeHead, 'end': end};`  
 `limiter.processRequest(sampleReq, sampleRes, callback);`  
  where,  
	 sampleReq is the request object		
	sampleRes is the response object   
	callback is called with request and response if the limit is not reached  

## Build Status:
[![Build Status](https://travis-ci.org/cloudkick/rate-limiter.svg)](https://travis-ci.org/cloudkick/rate-limiter)

## Tests
`npm test`

## Lint
`npm run-script lint`
