# Zadanie_1 ---------------------------------------------------------------

# m = matrix(3, 3, 4)
# изменение по индексам
# m[1, 3] = 4
# m[2, 1] = 1
# m[3, 2] = NA
# m[3, 4] = 1
# print(m)


# Zadanie_2 ---------------------------------------------------------------

# a <- c(1, 3, 4, 9, NA)
# b <- c(5, 6, 7, 0, 2)
# c <- c(9, 10, 13, 1, 20)
# # Столбцами
# 
# m_cols <- cbind(a, b, c)
# print(m_clos)
# 
# #Строками
# 
# m_rows <- rbind(a, b, c)
# print(m_rows)

# rownames(mat) <- paste("row", 1:dim(mat)[1], sep = "_")
# colnames(mat) <- paste("col", 1:dim(mat)[2], sep = "_")


# Zadanie_3 ---------------------------------------------------------------

# name <- c("Boris", "Ivan", "Daria", "Alan", " ")
# age <- c(19, 18, 17, 21, NA)
# sex <- c(0, 0, 1, 0, NA)
# 
# # Столбцами
# 
# m <- cbind(name, age, sex)
# print(m)



# age_sq <- as.numeric(m[, "age"])^2
# m <- cbind(m, age_sq)

# Фреймы могут хранить разные данные
# frame <- data.frame(name, age, sex)
# m <- cbind(m, as.numeric(m[,"age"])^2)
# colnames(m)[length(colnames(m))] <- "age_sq"
# print(m)


# Zadanie_4 ---------------------------------------------------------------
# name <- c("Jane", "Michael", "Mary", "George")
# age <- c(8, 6, 28, 45)
# sex <- c(0, 1, 0, 1)
# 
# info <- list(name, age, sex)
# # Вывести имя
# print(info[[1]][2])
# 
# # Вывести sex
# print(info[[3]])
# 
# # назвать векторы в списке и вывести name
# 
# info <- list(name=name, age=age, sex=sex)
# print(name)
# 
# # добавить напитки
# 
# info[["drinks"]] <- c("juice", "tea", "rum", "coffee")
# print(info)
# 
# # Добавить микрочелика
# info[["newPerson"]] <- c(name="John", age="2", sex="1", drinks="need some milk")
# print(info)


# Zadanie_5 ---------------------------------------------------------------

# index <- "0,72;0,38;0,99;0,81;0,15;0,22;0,16;0,4;0,24"
# I <- unlist(strsplit(gsub('[,]', '.', index), ';'))
# print(as.double(I))



# Part_2_Zadanie_1 --------------------------------------------------------

# m <- diag(c(4,9), 2, 2)
# rownames(m) <- c("eq1", "eq2")
# colnames(m) <- c("x1", "x2")
# print(m)

# Zadanie_2 ---------------------------------------------------------------


# m <- diag(c(4,9), 2, 2)
# eigenvalues <- eigen(m, only.values = T)$values
# print(eigenvalues)


# Zadanie_3 ---------------------------------------------------------------

# m <- diag(c(4,9), 2, 2)
# B <- diag(nrow = 2, ncol = 2) - m
# print(B)

# Zadanie_4_5 -------------------------------------------------------------
# m <- diag(c(4,9), 2, 2)
# f <- c(4, 2)
# u <- c(0.2, -0.3)
# 
# u_result <- solve(m, f) / u
# print(u_result)

# Zadanie_6_7 -------------------------------------------------------------

# uIter <- list()
# for(i in 1:7)
# {
#   uIter <- c(uIter, list((B %*% (if(!!length(uIter)) uIter[[length(uIter)]] else u ) + f) [,1]))
# }
# print(uIter)
# 
# print(uIter[[7]])
# 
# u_result
# print(uIter[[7]] - u_result)

# Zadanie_8 ---------------------------------------------------------------

# A1 = m / max(m)
# f1 = f / max(m)
# print(A1)
# print(f1)


# Zadanie_9_10 ------------------------------------------------------------

# eigenvalues1 <- eigen(A1, only.values = TRUE)$values
# eigenvalues1
# B1 <- diag(nrow = 2, ncol = 2) - A1
# B1
# u_result1 <- solve(A1, f1) / u
# u_result1
# uIter1 <- list()
# for(i in 1:7){
#   uIter1 <- c(uIter1, list((B1 %*% (if(!!length(uIter1)) uIter1[[length(uIter1)]] else u) + f1)[,1]))
# }
# uIter1
# uIter1[[7]]
# u_result1
# print(uIter1[[7]] - u_result1)



# Part_3--------------------------------------------------------

# step <- 1 # Шаг сетки
# dekart_begin <- -5 # Начало сетки
# dekart_end <- 5 # Конец сетки
# 
# 
# # Задание сеточной поверхности
# x <- seq(from= dekart_begin, to= dekart_end, by=step)
# y <- x
# 
# # Задание двумерной функции на коорд сетке
# surface_matrix <- outer(X = x, Y = y, FUN = function(x, y) Re(exp(-1i * 0.5 * x * y)))
# print(dimnames(surface_matrix) <- list(x, y))


# Zadanie_1 ---------------------------------------------------------------

# f <- "summary.txt"
# write(paste("number of matrix elements:", prod(dim(surface_matrix))), f)
# 
# write(paste("number of rows:", dim(surface_matrix)[1]), f, append=T)
# 
# write(paste("number of cols:", dim(surface_matrix)[2]), f, append=T)
# 
# write(paste("sum of main diag elements:", sum(diag(surface_matrix))), f, append=T)
# 
# write(paste("sum of middle row elements:", sum(surface_matrix[round(dim(surface_matrix)[1] / 2),])), f, append=T)
# 
# write(paste("sum of middle cloumn elements:", sum(surface_matrix[,round(dim(surface_matrix)[1]/2)])), f, append=T)
# 
# write(paste("row sums:", rowSums(surface_matrix)), f, append=T)
# 
# write(paste("col sums:", colSums(surface_matrix)), f, append=T)


# Zadanie_2 ---------------------------------------------------------------

# step <- as.integer(readline("step: "))
# dekart_begin <- as.integer(readline("begin: "))
# dekart_end <- as.integer(readline("end: "))
# 
# x <- seq(from = dekart_begin, to = dekart_end, by = step)
# y <- x
# 
# surface_matrix <- outer(X = x, Y = y, FUN = function(x,y) Re(exp(-1i*0.5*x*y)))
# dimnames(surface_matrix) <- list(x, y)
# 
# f <- "summary2.txt"
# write(paste("number of matrix elements:", prod(dim(surface_matrix))), f)
# 
# write(paste("number of rows:", dim(surface_matrix)[1]), f, append=T)
# 
# write(paste("number of cols:", dim(surface_matrix)[2]), f, append=T)
# 
# write(paste("sum of main diag elements:", sum(diag(surface_matrix))), f, append=T)
# 
# write(paste("sum of middle row elements:", sum(surface_matrix[round(dim(surface_matrix)[1] / 2),])), f, append=T)
# 
# write(paste("sum of middle cloumn elements:", sum(surface_matrix[,round(dim(surface_matrix)[1]/2)])), f, append=T)
# 
# write(paste("row sums:", rowSums(surface_matrix)), f, append=T)
# 
# write(paste("col sums:", colSums(surface_matrix)), f, append=T)


# Zadanie_3 ---------------------------------------------------------------

# file <- as.integer(readLines("input.txt"))
# 
# stepX <- file[1]
# dekart_beginX <- file[2]
# dekart_endX <- file[3]
# 
# stepY <- file[4]
# dekart_beginY <- file[5]
# dekart_endY <- file[6]
# 
# x <- seq(from = dekart_beginX, to = dekart_endX, by = stepX)
# y <- seq(from = dekart_beginY, to = dekart_endY, by = stepY)
# 
# surface_matrix <- outer(X = x, Y = y, FUN = function(x,y) Re(exp(-1i*0.5*x*y)))
# dimnames(surface_matrix) <- list(x, y)
# 
# f <- "summary3.txt"
# write(paste("number of matrix elements:", prod(dim(surface_matrix))), f)
# 
# write(paste("number of rows:", dim(surface_matrix)[1]), f, append=T)
# 
# write(paste("number of cols:", dim(surface_matrix)[2]), f, append=T)
# 
# write(paste("sum of main diag elements:", sum(diag(surface_matrix))), f, append=T)
# 
# write(paste("sum of middle row elements:", sum(surface_matrix[round(dim(surface_matrix)[1] / 2),])), f, append=T)
# 
# write(paste("sum of middle cloumn elements:", sum(surface_matrix[,round(dim(surface_matrix)[1]/2)])), f, append=T)
# 
# write(paste("row sums:", rowSums(surface_matrix)), f, append=T)
# 
# write(paste("col sums:", colSums(surface_matrix)), f, append=T)


# Part_4 ------------------------------------------------------------------

# library(ggplot2)
# 
# cars_matrix <- as.matrix(cars)
# cars_speed <- cbind(rep(1, length(cars_matrix[, 1])), cars_matrix[,1])
# cars_dist <- cars_matrix[1:length(cars_speed[,1]), 2]
# alpha <- solve(t(cars_speed) %*% cars_speed) %*% t(cars_speed) %*% cars_dist
# 
# print(class(alpha)) # Проверить тип данных
# alpha <- as.vector(alpha)
# print(class(alpha))
# 
# print(paste("alpha_c = ", alpha[1]))
# print(paste("alpha_x = ", alpha[2]))
# 
# cars_speed_lm <- cars_matrix[,1] # Создать новый вектор на основе матрицы 6
# 
# cars_dist_lm <- alpha[1] + cars_speed_lm * alpha[2] # 7
# 
# dist_residuals <- abs(cars_dist_lm - cars_dist) # 8
# 
# sr<- mean(abs(rep(mean(dist_residuals), length(dist_residuals)) - dist_residuals))
# stand <- sd(dist_residuals)
# print(cars_dist_lm)






# Questions ---------------------------------------------------------------

#1) Способы создания матриц

# Используя функцию matrix
#matrix(1:6, nrow = 2, ncol = 3)

#Использование функции cbind() или rbind()
#для создания матриц путем объединения столбцов или строк
#cbind(c(1,2,3), c(4,5,6))
#rbind(c(1,2,3), c(4,5,6))

# Создание матрицы из массива
# array(1:6, dim = c(2, 3))

# Создание матрицы из списка векторов
# list_of_vecs <- list(c(1, 2, 3), c(4, 5, 6), c(7, 8, 9))
# 
# matrix(unlist(list_of_vecs), nrow = length(list_of_vecs), byrow = TRUE)


# Question_2 --------------------------------------------------------------
# Чем массивы данных отличаются от матриц

# Матрицы в отличии от массива содержат 2 измерения в таб структуре
# 
# Матрицы состоят из нескольких векторов одинаковой длины, а 
# массив это сингулярный вектор, упорядоченный по заданным размерам
# 
# Массивы являются надмножеством матриц, а матрицы это подмножество,
# частный случай массива
# 
# У матриц более широкий спектр операций сбора данных, а у массивов ограниченный
#  набор операций основанный на сборе данных
#  
# Массив предназначен для хранения данных, а матрицы для преобразования данных


# Question_3 --------------------------------------------------------------

# Приведите примеры операций над матрицами:

# Cоздаст матрицу 3x3 из случайных чисел
#matrix(rnorm(9), nrow=3)

# Умножение матрицы на число
#matrix1 * 2

# Умножение матрицы1 на матрицу2
#matrix1 %*% matrix2

# Транспонирование матрицы
#t(matrix1)

# Вычисление определителя матрицы
#det(matrix1)

# Вычисление обратной матрицы
# solve(matrix1)

# Виды операций над массивами

# сложение всех элементов массива с числом 10
#arr <- c(1, 2, 3, 4, 5)
#result <- arr + 10

# выбор подмассива с элементами от второго до четвертого включительно
#result <- arr[2:4]

# Question_4 --------------------------------------------------------------

# Для операций с матрицами в математике существует специальный набор правил,
# таких как правила умножения матриц или сложения матриц

# В R существуют специальные функции и пакеты,
# которые позволяют выполнять операции над матрицами и массивами


# Таким образом можно сказать что математические операции в R проще чем
# в математике благодаря встроенным библиотекам с которыми не нужно производить
# определённые вычислительные последовательности как в математике.

