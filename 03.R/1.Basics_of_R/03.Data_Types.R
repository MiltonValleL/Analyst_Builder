# ------NUMBERS
num_var <- 42
class(num_var)

dec_var <- 40.5
class(dec_var)

int_var <- 45L
class(int_var)


# ------CHARACTERS
str_var <- 'I love R'
str_var
class(str_var)


# ------LOGICAL DATA TYPE - BOOLEANS
true_var <- TRUE
true_var
class(true_var)


# ------VECTORS
vec_var <- c(10, 21, 42, 75)
vec_var
class(vec_var)


# ------LISTS
list_var <- list('Milton', 45, c(33,21,69,93), 'Machine Learning Rules')
list_var
class(list_var)


# ------FACTOR
factors_var <- factor(c('Red', 'Blue', 'Red', 'Green', 'Blue'))
factors_var
levels(factors_var)


# MATRIX - 2D structure
mat_var <- matrix(1:9, nrow=3, ncol=3)
mat_var

single_mat <- matrix(7:9)
single_mat


# DATA FRAME
df <- data.frame(
  Name = c('Milton', 'Marcela', 'Bertha'),
  Age = c(45, 38, 72),
  Score = c(75, 80, 90)
)
df
class(df)
