## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function - Makes a matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function - Gets the cached inverse of a matrix, or calculates it if not cached yet

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}


# Create a special "matrix object" that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  
  # Make the inverse as NULL 
  inv <- NULL
  
  # Function to set the matrix
  set <- function(y){
    x <<- y          
    inv <<- NULL     
  }
  
  # Function to get the matrix
  get <- function() x
  
  # Function to cache the inverse matrix
  setInverse <- function(solveMatrix) inv <<- solveMatrix
  
  # Function to retrieve the cached inverse
  getInverse <- function() inv
  
  # Return a list of functions 
  list(set = set, 
       get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)
}

# Function to compute the inverse of the special "matrix" or retrieve it
cacheSolve <- function(x, ...) {
  
  # Get the cached inverse
  inv <- x$getInverse()
  
  # If inverse exists in cache, return it
  if(!is.null(inv)){
    message("getting cached data")  
    return(inv)                      # Exit function early with cached value
  }
  
  # If not cached, calculate it:
  data <- x$get()           
  inv <- solve(data)        
  x$setInverse(inv)         
  inv                       
}
