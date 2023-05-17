# Zadanie_1 ---------------------------------------------------------------


# a <- 2
# y <- 4
# 
# z <- b
# b <- a
# a <- z
# print(b)
# print(a)


# Zadanie_2 ---------------------------------------------------------------

# x <- 3.5
# y <- "2,6"
# z <- 1.78
# h <- TRUE
# 
# cat(typeof(x), typeof(y), typeof(z), typeof(h))
# 
# h <- as.integer(h)
# y <- gsub(",", ".", y)
# y <- as.numeric(y)
# x <- as.character(x)
# 
# cat(typeof(h), typeof(y), typeof(x))



# Zadanie_3 ---------------------------------------------------------------

# dohod <- 1573
# dohod <- log(dohod)
# print(dohod)


# Zadanie_4 ---------------------------------------------------------------

# file <- "file.txt"
# if(file.exists(file))
# {
#   cat("The file open")
# }else
# {
#   file.create(file)
# }
# 
# #Ввод данных в файл
# value <- readline()
# writeLines(value, "file.txt")
# 
# 
# #Вывод данных из файла
# stuf <- readLines(con="file.txt")
# print(stuf)
# 
# stuf <- as.numeric(stuf)
# print(stuf)
# 
# f <- function(n)
# {
#   return (2 * n - 1)
# }
# print(f(stuf))


# PART_TWO_ZAD_1 ----------------------------------------------------------

# g <- c(1, 0, 2, 3, 6, 8, 12, 15, 0, NA, NA, 9, 4, 16, 2, 0)
# 
# print("первый элемент вектора:")
# print(g[1])
# 
# print("последний элемент вектора")
# print(g[length(g)])
# 
# print("элементы вектора с третьего по пятый включительно:")
# print(g[3:5])
# 
# print("элементы вектора, которые равны 2:")
# print(g[g == 2])
# 
# print("элементы вектора, которые больше 4:")
# print(g[g > 4])
# 
# print("элементы вектора, которые кратны 3:")
# print(g[g %% 3 == 0])
# 
# print("элементы вектора, которые больше 4 и кратны 3:")
# print(g[g > 4 & g %% 3 == 0])
# 
# print("элементы вектора, которые или меньше 1, или больше 5:")
# print(g[g < 1 | g > 5])
# 
# print("индексы элементов, которые равны 0:")
# print(which(g == 0))
# 
# print("индексы элементов, которые не меньше 2 и не больше 8:")
# print(which(g >= 2 & g <= 8))
# 
# print("элементы вектора по возрастанию,
#       с пропущенными значениями в конце без цифр «2»")
# print(sort(g[-15])) # ?????????
# v[length(v) - 1] <- 
#   print(v)

# Zadanie_2 ---------------------------------------------------------------

# v <- c(1, 9, 3, 4)
# v[length(v)] <- NA
# print(v)


# Zadanie_3 ---------------------------------------------------------------

# w <- c(0, 1, NA, NA)
# print(which(is.na(w)))

# Zadanie_4 ---------------------------------------------------------------
# w <- c(0, 1, NA, NA)
# print(sum(is.na(w)))

# Zadanie_5 ---------------------------------------------------------------
#print(id <- 1:100)


# Zadanie_6 ---------------------------------------------------------------

# cnt <- rep(c("France", "Italy", "Spain"), each= 5)
# year <- rep(2000:2004, 3)
# data <- cbind.data.frame(cnt, year)
# View(data)

# Zadanie_7 ---------------------------------------------------------------

# income <- c(10000, 32000, 28000, 150000, 65000, 1573)
# 
# sr <- sum(income) / length(income)
# 
# income_class <- as.integer(income >= sr)
# print(income_class)



# Zadanie_8 ---------------------------------------------------------------
# Вариант 25
n <- 14
p <- 4.40

#set.seed(50) - чтобы подаваемые данные не изменялись

coords <- sample(5:50, n)
writeLines(as.character(coords), con= "coords.txt", sep="\n")
coordsFromFile <- as.numeric(readLines("coords.txt"))
write(sum(abs(coordsFromFile)^p)^(1 / p), "result.txt") 

a <- read.table("result.txt")
print(a)


# Zadanie_9 ---------------------------------------------------------------
# Вариант 25

# N <- 14
# coords <- sample(5:50, N)
# writeLines(as.character(coords), con = "coords.txt", sep = "\n")
# coordsFromFile <- as.numeric(readLines("coords.txt"))
# if(N>=1){
#   diff1 <- coordsFromFile[-1] - coordsFromFile[-length(coordsFromFile)]
# }
# if(N>=2){
#   diff2 <- diff1[-1] - diff1[-length(diff1)]
# }
# if(N>1){
#   write(diff1, "diff_vectors.txt", ncolumns = N-1)
# }
# if(N>2){
#   write(diff2, "diff_vectors.txt", ncolumns = N-2, append = TRUE)
# }


# Questions ---------------------------------------------------------------

#1) примеры операций над векторами

# x <- c(88, 5, 12, 13)
# x <- c(x[1:3], 168, x[4]) # Вставить 168 перед 13
# 
# length(x) # Получение длины вектора
# 
# print("+"(2, 3))
# x <- c(1, 2, 4)
# print(x + c(5, 0, -1))
# print(x * c(5, 0, -1))

# примеры функций создания и обработки векторов

employees <- c("Sabby", "Cathy", "Lucy") # Создание вектора

numbers <- rep(c(2,4,6), times = 2) # times для повторения элементов векторов


