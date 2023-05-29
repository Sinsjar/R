

# Part_1_Zadanie_1 -----------------------------------------

ID = 1:3
Country = c("Flatland", "Wonderland", "Sphereland")
Craziness <- c(20, 15, 18)
Region_type <- c("A", "B", "A")
Author <- c("Abbot", "Carroll", "Burger")
Size <- c(10, 100, 30)

db <- data.frame(ID = ID, Country=Country, Craziness=Craziness,
                 Region_type=Region_type, Author=Author, Size=Size)
names(data)



#View(db) # Просмотреть данные наглядно!



kol_num <- 0
kol_char <- 0
kol_fact <- 0

#sapplay - возвращает вектор

class_count <- function(db)
{
  kol_num <- sum(sapply(db, is.numeric))
  kol_char <- sum(sapply(db, is.character))
  kol_fact <- sum(sapply(db, is.factor))
  res <- c(kol_num, kol_char,kol_fact)
  names(res) <- c("numeric", "character", "factor")
  return (res)
}
#
class_count(db)


# Zadanie_2 ---------------------------------------------------------------

library(dplyr)
extract_numeric_cols <- function(db) {

  # Выбрать столбцы типа numeric
  numeric_cols <- db %>%
    select_if(is.numeric)

  numeric_db <- data.frame(numeric_cols)

  return(numeric_db)
}

print("БД только с числовыми столбцами:")
print(extract_numeric_cols(db))


# Zadanie_3 ---------------------------------------------------------------


countVariableTypes <- function(database) {
  num_vars <- 0
  fac_vars <- 0
  char_vars <- 0

  for (col in names(database)) {
    if (is.numeric(database[[col]])) {
      num_vars <- num_vars + 1
    } else if (is.factor(database[[col]])) {
      fac_vars <- fac_vars + 1
    } else if (is.character(database[[col]])) {
      char_vars <- char_vars + 1
    }
  }

  return(c(numeric=num_vars, factor=fac_vars, character=char_vars))
}

print(countVariableTypes(db))


# Zadnie_4 ----------------------------------------------------------------

numeric_median <- function(vector){
  if (is.numeric(vector)){
    return (median(vector))
  }
  else{
    print('Vector is not numeric, cannot compute the median')
  }
}

numeric_median(c(1,2,3,4,5))
numeric_median(c('a', 'b', 'c'))


# Part_2 ------------------------------------------------------------------


# Zadanie_1 ---------------------------------------------------------------


if ("quantmod" %in% rownames(installed.packages()) == FALSE) {
  install.packages("quantmod") }
library(quantmod)
library(stringr)

downloadable_stocks <- c("ATVI", "^IXIC")

df <- getSymbols(Symbols = downloadable_stocks,
                 src = "yahoo",
                 from = as.Date.character("1900-01-01"))


df <- data.frame(get(downloadable_stocks[1]))

downloadable_stocks <- str_remove(downloadable_stocks, "[:punct:\\^]")
df <- data.frame(get(downloadable_stocks[1]))

rm(list = downloadable_stocks)


# Zadanie_2 ---------------------------------------------------------------



out_of_trend <- function(x, dt, method='Arifm')
  {
  stopifnot(length(x) > 3 & dt <= (ceiling(length(x)/2)-1) & is.numeric(x) & is.numeric(dt))
  stopifnot(method %in% c('Arifm', 'Geom', 'Garm'))
  y <- vector()
  if (method == 'Arifm'){
    for (i in c((1+dt):(length(x)-dt))){
      y <- append(y,log((x[i-dt] + x[i+dt])/(2*x[i])))
    }
    return (y)
  }
  else if (method == 'Geom'){
    for (i in c((1+dt):(length(x)-dt))){
      y <- append(y,log((x[i-dt] * x[i+dt])/(x[i]^2)))
    }
    return (y)
  }
  else if (method == 'Garm'){
    for (i in c((1+dt):(length(x)-dt))){
      y <- append(y, log((2 * x[i-dt] * x[i+dt])/(x[i] * (x[i-dt] + x[i + dt]))))
    }
    return (y)
  }
}


# Zadanie_3 ---------------------------------------------------------------


t = seq(0, 10, 0.1)

x = 2 * t + 3 + sin(2 * t)
x_n <- out_of_trend(x, 2, 'Arifm')
mean(x_n)


# Zadanie_4 ---------------------------------------------------------------

alter_johns <- function(y){
  for (i in y){
    stopifnot(is.numeric(i))
  }
  a_t <- numeric(length(y)-1)
  for (i in (1:(length(y)-1))){
    a_t[i] <- sum((1/(length(y)-i)) * abs(y[(1+i) : length(y)] - y[1:(length(y)-i)]))
  }
  return (a_t)
}


# Zadanie_5 ---------------------------------------------------------------


#plot(alter_johns(x_n))

plot(alter_johns(x_n), type = 'l', col='purple', lwd=10,
     xlab = 'Index', ylab='Alter_JOHNS(x_n)')

# Zadanie_6 ---------------------------------------------------------------

result_of_alter_johns <- alter_johns(out_of_trend(df$ATVI.Open,2,'Arifm'))
plot(result_of_alter_johns,type = 'l', col='cyan', lwd=3)

result_of_alter_johns_2 <- alter_johns(out_of_trend(df$ATVI.Adjusted, 400, "Garm"))
plot(result_of_alter_johns_2, type = 'l', col =  'red', lwd=1)


# Part_3 ------------------------------------------------------------------

SIM <- function(A, u0, f, n_iter = 10e5, eps=10e-7)
{
  
  stopifnot(n_iter>=0 & class(n_iter)=='numeric')
  stopifnot(eps>=0 & is.numeric(eps))
  stopifnot(is.numeric(A))
  stopifnot(class(f) == 'numeric')
  stopifnot(length(A) > 2, sqrt(length(A)) %% 1 == 0)
  maxaf <- max(A, f)
  A <- A/maxaf
  f <- f/maxaf
  B_matrix <- diag(rep(1, ncol(A))) - A
  u1 <- as.vector(B_matrix%*%u0 + f)
  for (i in c(1:n_iter)){
    if (max(abs(u1 - u0)) >= eps){
      u0 <- u1
      u1 <- B_matrix%*%u0 + f
    }
    else break
  }
  return (as.vector(u1))
}

A <- matrix(c(4,-1,1,2,7,1,1,-1,3), nrow=3, byrow=TRUE)
u0 <- c(0,0,0)
f <- c(3,-4,5)

res <- SIM(A, u0, f)
print(res)
