## Caching the inverse of a matrix

## This makes the object for caching the inverse of the matrix
## you input 

makeCacheMatrix <- function(x = matrix()) {
	## Makes a special matrix in  the cache 
	## first we make a collection of methods

	# initialize the inverse object 
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


## Solve the cached matrix created by makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

        m <- x$getinverse()

        # if already set, return inverse 
        if (!is.null(m)) {
        	message("getting cached data")
        	return(m)
        }

        # get the matrix data 
        data <- x$get()

        # matrix multiplication to calculate inverse
        m <- solve(data) %*% data

        # set the inverse to the solved data 
        x$setinverse(m)

        # return it. ta-da!!
        m
}
