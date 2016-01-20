## This code is for the Second Programming Assignment in the R Programming course on Coursera
## Hello Mr. (Ms.) Reviewer, nice to meet you
## To run this code: 
## 0. Source into R (if you're running RStudio, press the 'Source' button)
## 1. Run in the command console:
## 2. x <- makeCacheMatrix()
## 3. x$set(matrix(whatever matrix you like))
## 4. if you run cacheSolve(x), you'll get the matrix back from the cache
## 5. Enjoy!
## P.S. Make sure you input an invertible matrix

## This function makes the environments for the matrices

makeCacheMatrix <- function(x = matrix()) {
    m<-NULL
    set<-function(y){
        x<<-y #this assignment operator is special and calls the parent environments 
        m<<-NULL
    }
    get<-function() x
    setmatrix<-function(solve) m<<- solve
    getmatrix<-function() m
    list(set=set, get=get,
         setmatrix=setmatrix,
         getmatrix=getmatrix)
}


## This function solves the inversion

cacheSolve <- function(x=matrix(), ...) {
    m<-x$getmatrix()
    if(!is.null(m)){ #note that ! before a function means logical negation in R
        message("getting cached data")
        return(m)
    }
    matrix<-x$get()
    m<-solve(matrix, ...)
    x$setmatrix(m)
    m
}

#coded by @tigerfromlondon