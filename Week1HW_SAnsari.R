
# 1. Write a loop that calculates 12-factorial.

period <- 1
factorial <- 1
for(period in 1:12) { factorial <- factorial * period }

# 2.Show how to create a numeric vector that contains the sequence from 20 to 50 by 5.

sequence <- 5 * c(4:10)

# 3. Show how to take a trio of input numbers a, b, and c and implement the quadratic equation.

a <- 2
b <- 3
c <- 1

x1 <- (-1*b + sqrt(b^2-4*a*c))/(2*a)
x2 <- (-1*b - sqrt(b^2-4*a*c))/(2*a)
