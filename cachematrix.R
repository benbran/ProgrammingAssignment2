## Caching the inverse of a matrix

## This makes the object for caching the inverse of the matrix
## you input 

makeCacheMatrix <- function(x = matrix()) {

	## first we make a collection of methods

	# init 
	inv <- NULL

	# set the matrix
	set <- function(matrix) {
		m <<- matrix 
		inv <<- NULL
	}

	# return the matrix
	get <- function(matrix) {
		m 
	}

	# set the inverse 
	setinverse <- function(inverse) {
		inv <<- inverse 
	}

	# return inverse property
	gettinverse <- function(inverse) {
		inv  
	}

	# output the list of the above methods
	list(set=set, get=get, setinverse=setinverse,
		getinverse=getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

        m <- x$getinverse()

        # if already set, return inverse 
        if (!is.null(m)) {
        	message("getting cached data")
        	return(m)
        }

        # get matrix
        data <- x$get()

        # matrix multiplication to calculate inverse
        m <- solve(data) %*% data

        # set inverse 
        x$setinverse(m)

        # ta-da!!
        m
}
