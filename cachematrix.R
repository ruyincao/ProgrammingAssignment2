##the following two functions could be used to
##compute and cache the inverse of an invertible matrix

#this function creates a special "matrix" object that could cache its inverse
makeCacheMatrix<-function(x=matrix()) {
  ##   1.set the matrix
  ##   2.get the matrix
  ##   3.set the inverse
  ##   4.get the inverse
  InverseMatrix<-NULL
  set<-function(y) {
    x<<-y
    InverseMatrix<<-NULL
  }
  get<-function() x
  setInv<-function(inverse) InverseMatrix <<-inverse
  getInv<-function() InverseMatrix
  list(set=set,get=get,setInv=setInv,getInv=getInv)
}

##this function computes the inverse of the matrix returned by makeCacheMatrix().
##If the inverse has alredy been calculated, it will retrieves the inverse from the
##cache directly.
cacheSolve<-function(x,...) {
  InverseMatrix=x$getInv()
  if (!is.null(InverseMatrix)) {
    message("getting cached data")
  }
  Matrix=x$get()
  InverseMatrix=solve(Matrix)
  x$setInv(InverseMatrix)
  return (InverseMatrix)
}
