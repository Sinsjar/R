# Load table --------------------------------------------------------------

library(dplyr)

#1
gazdata <- read.xlsx2(file='C:\\Users\\dancpp\\Documents\\GAZ.xlsx', sheetName='Sheet1', colClasses=c('character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'character', 'character', 'character'))
gazdata <- mutate(gazdata, дата.замера = if_else(grepl("/", дата.замера, fixed=TRUE), as.Date(дата.замера, format="%d/%m/%Y"), as.Date(as.integer(дата.замера), origin="1899-12-30")))
#2
gazdata <- filter(gazdata, apply(gazdata,1,function(x){!any(is.na(x))}))
#3
gazdata <- mutate(gazdata, Туст..С = Туст..С + 273.15)
colnames(gazdata)[3] <- "Туст..К"
#4
# ординальный формат данных? это такой, где можно сравнивать величины. строки можно сравнивать.
# может надо отсортировать по ним? Тогда arrange. Или сгруппировать? Тогда group_by.

gazdata$ID <- factor(gazdata$ID)
gazdata$Куст <- factor(gazdata$Куст)
gazdata$Группа <- factor(gazdata$Группа)
#5
gazdata <- mutate(gazdata, газ.конд = газ.м3.сут / конд.т.м3.сут)
gazdata <- mutate(gazdata, газ.вода = газ.м3.сут / вода.м3.сут)
gazdata <- mutate(gazdata, вода.конд = вода.м3.сут / конд.т.м3.сут)
#6
gazdata18 <- filter(gazdata, (function(x){format(x, '%Y')})(дата.замера)=='2018')
group_by(gazdata18, Куст)
#7
filter(gazdata18, ID=='111')
#8
select(filter(summarise(group_by(gazdata, ID), maxwat = max(вода.м3.сут)), maxwat <= 2.0), ID)
#9
select(filter(summarise(group_by(gazdata, ID), minwat = min(вода.м3.сут), mingaz = min(газ.м3.сут), mincnd = min(конд.т.м3.сут)), minwat + mingaz + mincnd >= 1000.0), ID)
#10
as.character(tail(arrange(summarise(group_by(gazdata18, Группа), sumgaz = sum(газ.м3.сут)), sumgaz)[,1], n=1))
#11
as.character(tail(arrange(summarise(group_by(gazdata18, Куст), sumwat = sum(вода.м3.сут)), sumwat)[,1], n=1))
#12
#читаем для газа
as.character(tail(arrange(summarise(group_by(gazdata, Куст), meangw = mean(газ.вода)), meangw)[,1], n=1))

