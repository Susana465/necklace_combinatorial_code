# These two first lines don't need to be run every time
# install.packages('plyr', repos = "http://cran.us.r-project.org")
# install.packages("numbers")
library(numbers)
library(ggplot2)

## From the documentation of necklace()
##     k: The size of the set or alphabet to choose from.
##     n: the length of the necklace

kn  <- expand.grid(k=1:3, n=c(1,2,3))
# kn  <- expand.grid(k=8, n=12)
# k  is the number of states a particular subunit can have
# n is the number of subunits

# Next line computes necklace number and saves it as 'N', and also computes the combinatorial explosion of possible states
knN  <- cbind(kn, N=apply(kn, 1, function(x) {necklace(x['k'], x['n'])} ),
              possible_states=apply(kn, 1, function(x){x['k']**x['n']})
              )

knN["logN"]  <-  log10(knN['N'])

ggplot(knN, aes(x=k,y=N)) + geom_line()
write.csv(knN, 'knN.csv', row.names=FALSE)

