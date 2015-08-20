## functions to create a matrix that can cache and retrieve its
## inverse

## creates a list of four functions to
## 1. set the value of a matrix
## 2. get the value of a matrix
## 3. set the value of the inverse
## 4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
     inv <- NULL
     set <- function(mat) {
          x <<- mat
          inv <<- NULL
     }
     get <- function() x
     setInv <- function(solve) inv <<- solve(x)
     getInv <- function() inv
     list(set = set, get = get, setInv = setInv, getInv = getInv)
}


## if inverse is cached, retrieves value from cache
## else, computes inverse

cacheSolve <- function(x, ...) {
     ## Return a matrix that is the inverse of 'x'
     inv <- x$getInv()
     if(!is.null(inv)) {
          message("getting cached data")
          return(inv)
     }
     mat <- x$get()
     inv <- solve(mat)
     x$setInv(mat)
     inv
}