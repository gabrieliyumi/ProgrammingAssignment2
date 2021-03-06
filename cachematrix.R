## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function()x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)){  #is it a valid matrix?
    message("getting cached data")
    return(m) 
  }
  data <- x$get()
  m <- solve(data,...)
  x$setinverse(m) #set the inverse
  m
}

b <- matrix(c(1,2,3,4),2,2) #create matrix testing
btest <- makeCacheMatrix(b) #catch matrix
cacheSolve(btest) # set inverse matrix