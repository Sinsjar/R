install.packages('ggplot2')
library(ggplot2)

# Load table --------------------------------------------------------------

Sys.setlocale("LC_ALL", "ru_RU")
#download.file('https://raw.githubusercontent.com/qwerty29544/RpracticeBook/master/2Data/01FlatTables/ECG_yurchenkov.txt',
#destfile='db.txt')

tableInfo <- read.table('C:\\Users\\Sinsjar\\Desktop\\R_projects\\Work_8\\db.txt',
                        skip=1, nrows=4,
                        sep='<', colClasses = c('character', 'character'),
                        strip.white=TRUE)$V1

ntracks <- as.integer(tableInfo[3])

nfrags <- as.integer(tableInfo[4])

tracksInfo <- data.frame(matrix('', nrow=ntracks, ncol=5))

for(i in 1:ntracks){tracksInfo[i,1:5] <- read.table('C:\\Users\\Sinsjar\\Desktop\\R_projects\\Work_8\\db.txt', skip=7*i,
                                                    nrows=5, sep='<',
                                                    colClasses = c('character',
                                                                   'character'),
                                                    strip.white=TRUE)$V1}

fragsInfo <- data.frame(matrix('', nrow = nfrags, ncol = 4))

myData <- list()
for(i in 1:nfrags){
  fragsInfo[i,1:4] <- read.table('C:\\Users\\Sinsjar\\Desktop\\R_projects\\Work_8\\db.txt', skip=42+sum(as.integer(fragsInfo[,4]), na.rm=TRUE)+7*(i-1), nrows=4, sep='<', colClasses = c('character', 'character'), strip.white=TRUE)$V1
  myData[[i]] <- read.table('C:\\Users\\Sinsjar\\Desktop\\R_projects\\Work_8\\db.txt',
                            skip=46+sum(as.integer(fragsInfo[-i,4]),
                                        na.rm=TRUE)+7*(i-1),
                            nrows=as.integer(fragsInfo[i,4]),
                            colClasses = c('integer', 'numeric', 'numeric',
                                           'numeric', 'numeric', 'numeric'),
                            strip.white=TRUE, header=TRUE, dec=',')
}
hist(myData[[1]]$X0, add=F, col=rgb(1,0,0,0.5), freq=TRUE)