#
#	Defining the function "myfactorial" to accept two inputs, checking
#	them for valid vlaues (making sure they're positive and that n > r).
#	Calculating each factorial separately, and then calculating the
#	result from the individual values. If bad numbers are passed in,
#	then we just return an 'invalid input' result.
#


myfactorial <- function(n,r) {
	if(n>r & n>0 & r>0)
	{
		nfac <- 1
		rfac <- 1
		nlessr <- n-r
		nlessrfac <- 1
		for(counter in 1:n) { nfac <- nfac * counter }
		for(counter in 1:r) { rfac <- rfac * counter }
		for(counter in 1:nlessr) { nlessrfac <- nlessrfac * counter }
		result <- nfac / ( nlessrfac * rfac )
	}
	else
	{
		result <- 'invalid input'
	}
	return(result)
}

#
#	Testing, the function by passing in test case, as well as a
#	few bad values.
#

testing <- myfactorial(8,5)
testing
testing <- myfactorial(5,8)
testing
testing <- myfactorial(-8,5)
testing
testing <- myfactorial(-8,-5)
testing