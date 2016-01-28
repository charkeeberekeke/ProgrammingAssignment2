## Put comments here that give an overall description of what your
## functions do

## makecacheMatrix is a function that stores a matrix and its inverse and provides an 
## interface to get/set the matrix and its inverse

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinv <- function(y) i <<- y
    getinv <- function() i
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}

## cacheSolve takes advantage of the caching feature of makeCacheMatrix by 
## computing for the matrix's inverse only if the inverse is not yet populated within the makeCacheMatrix object

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    inv <- x$getinv()
    if (!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data)
    x$setinv(inv)
        ## Return a matrix that is the inverse of 'x'
    inv
}