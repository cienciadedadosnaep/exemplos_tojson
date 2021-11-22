library(jsonlite)
library(rjson)
library(RJSONIO)
ano <- c('2012','2013','2014','2015')
MatchaLatte<- c(41.1, 30.4, 65.1, 53.3)
MilkTea<- c(86.5, 92.1, 85.7, 83.1)
CheeseCocoa<-c(24.1, 67.2, 79.5, 86.4)


df <- data.frame(ano,MatchaLatte,MilkTea,CheeseCocoa)

dft <- t(df)

names(dft)

dft_n<- data.frame(as.character(row.names(dft)),dft)

names(dft_n) <- c("X0","X1","X2","X3","X4")

names(dft_n)
library(dplyr)
dft_n<- dft_n %>% mutate(across(c(2,3,4,5), as.numeric))

    rownames(dft_n)<-NULL
    
    
teste5<-  jsonlite::toJSON(dft_n,dataframe = "values")    
teste5
##########################################################    

dft_nlanos <- dft_n[1,]
names(dft_nlanos) <- NULL 
dft_nlanos <- as.character(dft_nlanos)


dft_nl <-  dft_n[-c(1),]



teste6 <- list(dft_nlanos,dft_nl)
    
    
teste7<- jsonlite::toJSON(teste6,dataframe = "values")    


teste8 <- gsub('\\[\\[','[',teste7)
teste9 <- gsub('\\]\\]\\]',']',teste8)
teste9 



data_serie <- paste('[',teste9,']',sep = '')

