# url <- "https://raw.githubusercontent.com/allatambov/R-programming-3/master/seminars/sem8-09-02/demography.csv"
# destfile <- "C:/Users/Sinsjar/Desktop/R_projects/Work_10_New"
# download.file(url, destfile="demography.csv", mode="wb")

# if ("ggplot2" %in% rownames(installed.packages()) == FALSE) {
#   install.packages("ggplot2")
# }


db <- read.csv("demography.csv")

#View(db)

# Zadanie_2 ---------------------------------------------------------------

# доля населения возраста моложе трудоспособного
young_share <-(db$young_total / (db$young_total + db$wa_total + db$ret_total))


# доля населения трудоспособного возраста
trud_share <- ((db$wa_total / (db$young_total + db$wa_total + db$ret_total)))

# доля населения возраста, старше трудоспособного
old_share <- ((db$ret_total / (db$young_total + db$wa_total + db$ret_total)))

cat("Доля населения моложе трудоспособного возраста: ", young_share, "%\n")
cat("Доля населения трудоспособного возраста: ", trud_share, "%\n")
cat("Доля населения старше трудоспособного возраста: ", old_share, "%\n")


# Zadanie_3 ---------------------------------------------------------------

ggplot(db, aes(x = trud_share)) +
  geom_histogram(color = "black", fill = "skyblue", 
                 alpha = 0.7, bins = 10) +
  geom_rug() +
  geom_vline(xintercept = median(trud_share), 
             color = "red", linetype = "dashed") +
  labs(title = "Доля трудоспособного населения в процентах",
       x = "Доля трудоспособного населения",
       y = "Частота") +
  theme_minimal()


# Zadanie_4 ---------------------------------------------------------------

library('ggplot2')
ggplot(fortify(db), aes(x=trud_share, fill=region)) +
  geom_density(alpha=0.5) +
  scale_fill_manual(values=c("#00AFBB", "#E7B800", "#FC4E07", "#00BFC4")) +
  labs(x="Доля трудоспособного населения, %", y="Плотность") +
  ggtitle("Сглаженная гистограмма распределения доли трудоспособного населения по регионам") +
  facet_wrap(~ region, ncol=2)

# Скрипичная диаграмма
library('ggplot2')
ggplot(fortify(db), aes(x=region, y=trud_share, fill=region)) +
  geom_violin(alpha = 0.5) +
  scale_fill_manual(values=c("#00AFBB", "#E7B800", "#FC4E07", "#00BFC4")) +
  labs(x="Регион", y="Доля трудоспособного населения, %") +
  ggtitle("Распределение доли трудоспособного населения по регионам") +
  theme_minimal()

# Zadanie_5 ---------------------------------------------------------------

library(ggplot2)
library(ggpubr)

ggplot(db, aes(x=young_share, y=old_share)) +
  geom_point(color='black', shape = 11, size= 4) +
  labs(title='Плотность распределения доли трудоспособности населения в %',
       x = 'Доля трудоспособного населения',
       y = 'Плотность') +
  theme_minimal()


# Рассеяние
ggplot(data = db, aes(x = young_share, y= old_share)) +
  geom_point(color = "red", shape = 25, size = 5) + theme_bw() +
  labs(x= "Процент населения моложе трудоспособного",
       y= "Процент населения старше трудоспособного")


# Zadanie_6 ---------------------------------------------------------------


female <- db$young_female + db$wa_female + db$ret_female
male <- db$young_male + db$wa_male + db$ret_male
female_share <- female / db$popul_total * 100
male_share <- male / db$popul_total * 100
cat(male_share)
ifelse(male_share > female_share, 1, 0) -> Male
print(Male)


# Zadanie_7 ---------------------------------------------------------------

ggplot(db, aes(x= young_share, y= old_share)) +
  geom_point(aes(size = male_share, color = Male)) +
  labs(x= "Доля молодых", y= "Доля пожилых", size= "Доля мужчин",
       color= "Преобладание мужчин")


library(ggplot2)


ggplot(db, aes(x = region)) +
  scale_y_continuous(breaks = seq(0, 30, by = 5)) +
  geom_bar(fill= "pink", color= "black") +
  labs(x= "Регион", y= "Количество")



# Part_2 ------------------------------------------------------------------
library(ggplot2)

ggplot(data = mtcars, aes(x = hp, y = wt)) +
  geom_point(aes(size = cyl, color = as.factor(am))) +
  labs(title = "Характеристики автомобилей", 
       x = "Число лошадиных сил", 
       y = "Вес", 
       color = "Коробка передач", 
       size = "Число цилиндров") +
  scale_color_manual(values = c("green", "red"),                    
                     labels = c("Автомат", "Механика"))



# Zadanie_2 ---------------------------------------------------------------
library(ggplot2)

data <- mtcars

# Первый график (автоматическая коробка передач)
ggplot(data = mtcars, aes(x = hp)) + 
  geom_histogram(fill = "brown", 
                 color = "black", 
                 bins = 6) +  
  labs(title = "Gross horsepower", 
       x = "Horsepower", 
       y = "count") + 
  theme_bw() + 
  facet_grid(~am,
             labeller = labeller(am = c("0" = "Automatic", 
                                        "1" = "Mechanic")))

# Zadanie_3 ---------------------------------------------------------------

library(ggplot2)

data(sleep)

ggplot(sleep, aes(x="", y=extra, fill=group)) +
  geom_boxplot()+
  labs(x= "Groups", y= "Extra hours of sleep",
       title="Boxplot of extra sleep hours by group") +
  scale_fill_manual(values=c("skyblue", "orange"))



# Part_3 ------------------------------------------------------------------

# url <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"
# destfile <- "C:/Users/Sinsjar/Desktop/R_projects/Work_10_New"
# download.file(url, destfile="COVID_PIZDA_VSEM.csv", mode="wb")

library(dplyr)
library(ggplot2)
library(tidyr)

df<- read.csv("COVID_PIZDA_VSEM.csv")

colnames(df)[1:4] <- c("Регион", "Страна", "Широта", "Долгота")

df <- unite(df, "Страна/Регион", c("Регион","Страна"))

date <- colnames(df[4:ncol(df)])
date <- gsub("X", "", date)
month <- stringr::str_extract(date, "(\\d{1,2})")
day <- stringr::str_extract(date, "(\\d{1,2})+\\.(\\d{1,2})", group=2)
year <- stringr::str_extract(date, "(\\d{1,2})+\\.(\\d{1,2})+\\.(\\d{2})", group=3)
month <- as.integer(month)
day <- as.integer(day)
year <- paste("20", year, sep = "")
year <- as.integer(year)

date <- as.Date(ISOdate(year, month, day))

df <- as.data.frame(t(data.frame(df[1:nrow(df), 4:ncol(df)],
                                 row.names = df[1:nrow(df[1]), 1])))
row.names(df) <- NULL
df$"Дата" <- date
df <- df %>%
  relocate("Дата")

View(df)

ggplot(df, mapping = aes(x=1:nrow(df), y = df$'_Antarctica')) +
  geom_point() +
  labs(title = "Статистика COVID-19 Antarctica",
       x = "Дни",
       y = "Количество заболевших") +
  theme_minimal()

ggplot(df, mapping = aes(x=1:nrow(df), y = df$'_Albania')) +
  geom_point() +
  labs(title = "Статистика COVID-19 Albania",
       x = "Дни",
       y = "Количество заболевших") +
  theme_minimal()

ggplot(df, mapping = aes(x=1:nrow(df), y = df$'_Armenia')) +
  geom_point() +
  labs(title = "Статистика COVID-19 Armenia",
       x = "Дни",
       y = "Количество заболевших") +
  theme_minimal()

