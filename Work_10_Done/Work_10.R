# url <- "https://raw.githubusercontent.com/allatambov/R-programming-3/master/seminars/sem8-09-02/demography.csv"
# destfile <- "C:/Users/Sinsjar/Desktop/R_projects/Work_10"
# download.file(url, destfile="demography.csv", mode="wb")

#db <- read.csv("demography.csv")

#View(db)

# region: название региона;
# district: название района;
# empl_total: численность занятого населения;
# А-O: занятость по отраслям (как на сайте Росстата: сельское хозяйство);
# popul_total: численность населения;
# urban _total: численность городского населения;
# rural_total: численность сельского населения;
# wa_total: численность трудоспособного населения;
# wa_female: численность трудоспособного населения (женский пол); 
# wa_male: численность трудоспособного населения (мужской пол);

# ret_total: численность пенсионеров;
# ret_female: численность пенсионеров (женский пол); 
# ret_male: численность пенсионеров (мужской пол); 
# young_total: численность населения, моложе трудоспособного возраста; 
# young_ female: численность населения, моложе трудоспособного возраста ( женский пол); 
# young_ male: численность населения, моложе трудоспособного возраста (мужской пол); 
# Х18_19 - X70_plus: численность населения по возрастным группам. 

# Zadanie_2 ---------------------------------------------------------------

# wa_total: численность трудоспособного населения;
# ret_ total: численность пенсионеров;
# young_total: численность населения, моложе трудоспособного возраста; 


# доля населения возраста моложе трудоспособного
#young_share <- sum((db$young_total / (db$young_total + db$wa_total + db$ret_total)))

# доля населения трудоспособного возраста
#trud_share <- sum((db$wa_total / (db$young_total + db$wa_total + db$ret_total)))

# доля населения возраста, старше трудоспособного
#old_share <- sum((db$ret_total / (db$young_total + db$wa_total + db$ret_total)))

#cat("Доля населения моложе трудоспособного возраста: ", young_share, "%\n")
#cat("Доля населения трудоспособного возраста: ", trud_share, "%\n")
#cat("Доля населения старше трудоспособного возраста: ", old_share, "%\n")


# Zadanie_3 ---------------------------------------------------------------

# library(dplyr)
# 
# median_value <- median(trud_share)
# 
# hist(trud_share,
#      col= "blue",
#      xlab= "Трудоспособное население",
#      ylab= "Частота",
#      main= "Гистограмма населения трудоспособного возраста",
#      breaks= seq(0, 100, by= 10),
#      ylim= c(0, 10))
# 
# rug(trud_share, col = "red")
# abline(v= median_value, col= "green")


# Zadanie_4 ---------------------------------------------------------------

# library('ggplot2')
# ggplot(fortify(db), aes(x=trud_share, fill=region)) + 
#   geom_density(alpha=0.5) + 
#   scale_fill_manual(values=c("#00AFBB", "#E7B800", "#FC4E07", "#00BFC4")) +
#   labs(x="Доля трудоспособного населения, %", y="Плотность") + 
#   ggtitle("Сглаженная гистограмма распределения доли трудоспособного населения по регионам") +
#   facet_wrap(~ region, ncol=2)
# 
# # Скрипичная диаграмма
# library('ggplot2')
# ggplot(fortify(db), aes(x=region, y=trud_share, fill=region)) +
#   geom_violin() +
#   scale_fill_manual(values=c("#00AFBB", "#E7B800", "#FC4E07", "#00BFC4")) +
#   labs(x="Регион", y="Доля трудоспособного населения, %") +
#   ggtitle("Распределение доли трудоспособного населения по регионам") +
#   facet_wrap(~ region, ncol=2)



# Zadanie_5 ---------------------------------------------------------------

# library(ggplot2)
# library(ggpubr)
# 
# ggplot(db, aes(x=young_share, y=old_share)) +
#   geom_point(color='black') +
#   labs(title='Scatter Plot of Young Share and Old Share', x='Young_Share', y='Old_Share')

#Корреляция - меняется
# ggplot(db, aes(x = young_share, y = old_share)) +
#   geom_point(color = 'blue') +
#   stat_cor(method = "pearson", label.x = 50, label.y = 50) +
#   labs(title = 'Scatter Plot of Young Share and Old Share', x = 'Young_Share', y = 'Old_Share')

#чем больше процент молодого
# населения (моложе трудоспособного населения), тем больше процент
# пожилых людей


# Zadanie_6 ---------------------------------------------------------------

#доля мужского населения в районе / городе
#male_share <- sum(na.omit(db$wa_total / db$popul_total))
#cat(male_share, "%")

# доля мужчин в муниципальном
#woman_dol <- sum(db$wa_female / db$popul_total)

#cat(woman_dol, "%")

#ifelse(male_share > woman_dol, 1, 0) -> male
#print(male)


# Zadanie_7 ---------------------------------------------------------------

# ggplot(db, aes(x= young_share, y= old_share, size= male_share, color= male)) +
#   geom_point(alpha= 0.7) + 
#   scale_size(range= c(10, 20)) +
#   labs(x= "Доля молодых", y= "Доля пожилых", size= "Доля мужчин", 
#        color= "Преобладание мужчин") + 
#   theme_bw()



# district_counts <- db %>%
#   group_by(region) %>%
#   summarise(num_districts = n_distinct(district))
# 
# print(district_counts)
# 
# library(ggplot2)
# 
# ggplot(data=district_counts, aes(x=region, y=num_districts, fill=region)) +
#   geom_bar(stat="identity") +
#   labs(title="Количество районов в разбивке по регионам",
#        x="Регион", y="Количество районов")




# Part_2 ------------------------------------------------------------------
# library(ggplot2)
# 
# data(mtcars)
# 
# mtcars$am <- factor(mtcars$am, labels = c("Automatic", "Manual"))
# 
# ggplot(mtcars, aes(x = wt, y = hp, color = am, size = cyl)) +
#   geom_point(alpha = 0.7) +
#   scale_color_manual(values = c("green", "red")) +
#   labs(title = "Relationship between Gross horsepower (hp), Weight (wt), number of cylinders and transmission type",
#        x = "Weight (1000 lbs)",
#        y = "Gross horsepower (hp)",
#        color = "Transmission type",
#        size = "Number of cylinders")



# Zadanie_2 ---------------------------------------------------------------
# library(ggplot2)
# 
# data <- mtcars
# 
# # Первый график (автоматическая коробка передач)
# ggplot(subset(data, am==0), aes(x=hp, fill=factor(cyl))) +
#   geom_histogram(binwidth=20, position='dodge') +
#   scale_x_continuous(limits=c(100, 300)) +
#   labs(x="Horse power", y="Count", fill="Cylinders") +
#   ggtitle("Automatic transmission")
# 
# ggplot(subset(data, am==1), aes(x=hp, fill=factor(cyl))) +
#   geom_histogram(binwidth=20, position='dodge') +
#   scale_x_continuous(limits=c(100, 300)) +
#   labs(x="Horse power", y="Count", fill="Cylinders") +
#   ggtitle("Manual transmission")



# Zadanie_3 ---------------------------------------------------------------

# library(ggplot2)
# 
# data(sleep)
# 
# ggplot(sleep, aes(x="", y=extra, fill=factor(group))) +
#   geom_boxplot()+
#   labs(x="", y="Extra hours of sleep",
#        title="Boxplot of extra sleep hours by group") +
#   scale_fill_manual(values=c("skyblue", "orange"))



# Part_3 ------------------------------------------------------------------

# url <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"
# destfile <- "C:/Users/Sinsjar/Desktop/R_projects/Work_10"
# download.file(url, destfile="COVID_PIZDA_VSEM.csv", mode="wb")


library(ggplot2)

covid_data <- read.csv("COVID_PIZDA_VSEM.csv")
View(covid_data)

#geom_ploy

ggplot(covid_data, mapping = aes(x = rownames(covid_data),y = "Russia"))+
  geom_point(col='yellow', size=5)+
  labs(x='Время с начала пандемии', title = 'Динамика роста заболеваемости в России', subtitle = paste("Данные от", min(rownames(covid_data))))

ggplot(covid_data, mapping = aes(x = rownames(covid_data),y = "Austria"))+
  geom_point(col='orange', size=5)+
  labs(x='Время с начала пандемии', title = 'Динамика роста заболеваемости в России', subtitle = paste("Данные от", min(rownames(covid_data))))

ggplot(covid_data, mapping = aes(x = rownames(covid_data),y = "Netherlands"))+
  geom_point(col='blue', size=5)+
  labs(x='Время с начала пандемии', title = 'Динамика роста заболеваемости в России', subtitle = paste("Данные от", min(rownames(covid_data))))


#plotting hist 
ggplot(covid_data, mapping = aes(x = "Russia")) +
  geom_histogram(stat = "count", bins = 15, color = "red", fill = "skyblue") +
  geom_density(fill = "blue", alpha = 0.2) +
  labs(x = 'Замбия', y = 'Плотность')

ggplot(covid_data, mapping = aes(x = "Zambia")) +
  geom_histogram(stat = "count", bins = 15, color = "red", fill = "pink") +
  geom_density(fill = "blue", alpha = 0.2) +
  labs(x = 'Замбия', y = 'Плотность')


ggplot(covid_data, mapping = aes(x = "France")) +
  geom_histogram(stat = "count", bins = 15, color = "red", fill = "grey") +
  geom_density(fill = "grey", alpha = 0.2) +
  labs(x = 'Франция', y = 'Плотность')


