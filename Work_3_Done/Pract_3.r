
# Part_2 ------------------------------------------------------------------
# library(randomNames)
# set.seed(1234)
# names <- randomNames(100, which.names="first", ethnicity= 4)
# ages <- sample(16:75, 100, replace= T)# с повтор значениями
# views <- c("right", "left", "moderate", "indifferent")
# polit <- sample(views, 100, replace=T)# Случайны набор
# 
# #Создайте столбец id с номерами респондентов
# info$id <- 1:100
# 
# # Определить сколько людей в возрасте от 25 до 30
# 
# value <- nrow(info[info$ages >= 25 & info$ages <= 30, ])
# print(value)
# 
# # Выразите долю в процентах
# 
# dol <- value / nrow(info) * 100
# dol <- round(dol, digits = 1)
# print(dol)
# 
# # Создать факторный вектор
# 
# info$polit_views <- factor(info$polit)
# print(info)
# #Уровни фактора
# 
# print(levels(info$polit_views))
# print(length(levels(info$polit_views)))
# 
# # Добавить столбец в датафрейм polit_views
# info <- cbind.data.frame(names, ages, views, polit)
# head(info)



# Part_3_Zadanie_1 --------------------------------------------------------

# Загрузите файл фирмы

# library(ggplot2)
# library(dplyr)
# 
# if ("car" %in% installed.packages() == F){
#   install.packages("car")
# }
# library(car)
# firms <- Ornstein
# View(firms)
# 
# # Сколько в датафрейме наблюдений, Сколько перем Какие это перменные
# 
# str(firms)
# 
# # Заполненные строки, пропущенные значения
# nrow(firms[complete.cases(firms), ]) 
# nrow(firms[!complete.cases(firms), ])
# 
# # Фильтрация от 10000 до 20000
# filter1 <- subset(firms, assets >= 10000 & assets <= 20000)
# # Не превышает 30
# filter2 <- subset(firms, interlocks <= 30)
# #фирмы транспортного сектора (`TRN`) под руководством управляющих из Канады (`CAN`)
# filter3 <- subset(firms, sector == "TRN" & nation == "CAN")
# 
# # Создать переменную гетересексуальный логарифм
# 
# firms$log_assets <- log(firms$assets)
# 
# # Посторить график пропущенных наблюдений
# a <- nrow(firms[!complete.cases(firms), ])
# 
# b <- nrow(firms[complete.cases(firms), ])
# ggplot(data = firms, aes(x <- a, y <- 0)) + geom_line()
# 
# # Удалить пропущенные значения из бд
# firms <- na.omit(firms)
# 
# # Сохранить изменённую бд в формате Stata
# library(foreign)
# dta <- read.dta('Firms.dta')



# Part_3 ------------------------------------------------------------------


# Zadanie_1 ---------------------------------------------------------------


#df <- read.csv('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv')


# Zadanie_2 ---------------------------------------------------------------


# length(df) # Размерность
# 
# print(colnames(df) # Имена столбцов
# 
# str(df) # Типы данных

# Zadanie_3 ---------------------------------------------------------------

# library('tidyr')
# 
# df <- unite(df, region, c(Province.State, Country.Region)) # Слияние колонок


# Zadanie_4 ---------------------------------------------------------------

# library(matrixStats)
# data_stats <- data.frame(region=df[,1], Wid=df[,2], Long=df[,3], sumil=rowSums(df[c(4:ncol(data))]),
#                          meanx=rowMeans(df[c(4:ncol(df))]),
#                          sdx=rowSds(as.matrix(df[,c(4:ncol(df))]),
#                                     na.rm=TRUE))
# print(data_stats)



# Zadanie_6 ---------------------------------------------------------------


# library('dplyr')
# df_t<- t(as.matrix(df[, 4:ncol(df)]))
# colnames(df_t) <- df$region
# rownames(df_t)
# 
# rownames(df_t) <- gsub('X', '', rownames(df_t))
# rownames(df_t) <- gsub('\\.','-', rownames(df_t))
# rownames(df_t) <- format(as.Date(rownames(df_t), '%m-%d-%y'), "%Y-%m-%d")
# df_t <- as.data.frame(df_t)
# print(df_t)

# Zadanie_7 ---------------------------------------------------------------

# library('writexl')
# library('xlsx')
# library('openxlsx')
# outputDir <- 'data_output'
# if(!dir.exists(outputDir))
# {
#   dir.create(outputDir)
# }
# write.csv(df_t, file="data_output/CSV_TABLE.csv")
# 
# write.table(df_t, file="data_output/TXT_TABLE.txt", sep="\t")
# 
# write.xlsx(df_t, file="data_output/XLSX_TABLE.xlsx")



# Questions ---------------------------------------------------------------


# Question_1 --------------------------------------------------------------


# Каковы особенности фреймов

# Их особенности заключаются в хранении рахных типов данных
# Фреймы могут содержать имена столбцов и имена строк
# Фреймы могут содержать названия колонок
# Фреймы поддерживают индексацию как по столбцам так и по строкам
# Фреймы могут создаваться из векторов, списков и других фреймов данных,
# а также из файлов CSV XLSX TXT
# Фреймы могут быть преобразованы в другие структуры данных как матрицы или списки

# Функции для работы с фремами:
# data.frame() - создаёт фрейм данных
#read.table() -  считывает таблицу данных и создаёт по ним data.frame
#susbset() - возвращает подмножество элемента, которое соотв данному условию
#merge() - объединение двух таблиц


# Question_2 --------------------------------------------------------------

# Примеры создания фреймов

# df <- data.frame() # Создание пустого фрейма
# 
# # Создание фрейма из векторов
# name <- c("Alice", "Bob", "Charlie")
# age <- c(25, 30, 35)
# gender <- c("female", "male", "male")
# df <- data.frame(name, age, gender)
# 
# # Создание фрейма из матрицы
# mat <- matrix(1:9, ncol=3)
# df <- data.frame(mat)
# 
# # Создание фрейма из списка
# lst <- list(name=c("Alice", "Bob", "Charlie"), age=c(25, 30, 35), gender=c("female", "male", "male"))
# df <- data.frame(lst)


# Question_3 --------------------------------------------------------------

#Приведите примеры экспорта данных из среды R во внешние файлы

# Экспорт в CSV файл
# write.csv(data, file="dat.csv")
# 
# Экспорт в Excel файл
# library(xlsx)
# write.xlsx(data, file="data.xlsx", sheetName="Sheet1")
# 
# Экспорт в TXT файл
# write.table(data, file="data.txt", sep="\t")
# 
#  Экспорт в JSON файл
# write_json(data, file="data.json")
# 
# Экспорт в SQL бд
# library(RMySQL)
# dbwriteTable(con, "data", data)


# Question_4 --------------------------------------------------------------

# Списки представляют собой объекты, которые содержат упорядоченный набор
# элементов произвольных типов. Элементы спискс могут быть другими списками,
# функциями, векторами, матрицами и т.д. Элементы списка могут быть именованными
# с использованием символов или строк в качестве ключей.

# Создание списка с помощью функции list
# listic <- list(name="Josh Dikaprio", age= 30, hobby= "fishing")
# 
# #Вложенный список
# my_vlog <- list(name="Boris Kharakiriev", age=19,
#                 skills=list("Python", "C++", "R", "HTML"))


# Question_5 --------------------------------------------------------------

#Из длинного формата в широкий
#wide_data <- spread(long_data, subject, grade)

# Из широкого в длинный формат
# library(tidyr)
# my_data <- data.frame(name=c("John", "Alice"),
#                       grade_math=c(4.5, 3.7),
#                       grade_science=c(3.8, 4.2))
# print(my_data)
# 
# long_data <- gather(my_data, subject, grade, -name)
# print(long_data)


