## The following functions create a special data structure used to store a matrix and
## its inverse using a smiple cache mechanism. 

## This function initializes the special data structure.

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL;
    
    set_matrix <- function(y){
        x <<- y
    }
    
    get_matrix <- function() x
    
    set_inverse <- function(inverse){
        inv <<- inverse
    }
    
    get_inverse <- function() inv
    
    list(set_matrix = set_matrix, get_matrix = get_matrix,
         set_inverse = set_inverse, get_inverse = get_inverse)
}


## This method computes the inverse using the caching mechanism.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv <- x$get_inverse()
    
    if(!is.null(inv)){
        message('getting cached data')
        return(inv)
    }
    
    matrix <- x$get_matrix()
    inv <- solve(matrix)
    x$set_inverse(inv)
    inv
}
