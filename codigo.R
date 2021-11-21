library(jsonlite)
ano <- c('2012','2013','2014','2015')
MatchaLatte<- c(41.1, 30.4, 65.1, 53.3)
MilkTea<- c(86.5, 92.1, 85.7, 83.1)
CheeseCocoa<-c(24.1, 67.2, 79.5, 86.4)
df <- data.frame(ano, MatchaLatte, MilkTea, CheeseCocoa)
View(df)
jsonlite::toJSON(df,dataframe="columns")

jsonlite::toJSON(df,dataframe="values")


dft <- t(df)
View(dft)
jsonlite::toJSON(dft,dataframe="columns")


library(dplyr)


row.names(dft)


dft_a <- dft %>% mutate(V0=row.names())

nomebar <- row.names(dft)

dft_a <- dft %>% mutate(V0 = nomebar)

cbind(nomebar,dft)

dft_cb <- cbind(nomebar,dft)
jsonlite::toJSON(dft_cb,dataframe="columns")

matrix(c(ano,MatchaLatte,MilkTea,CheeseCocoa),ncol = 4)

names(dft_cb) <- c('v0','v1','v2','v3','v4')
names()

names(dft_cb)

dft_cb
df$ano
jsonlite::toJSON(df$ano)

jsonlite::toJSON(df$ano,dataframe = "columns")

jsonlite::toJSON(df$ano,dataframe = "values")

dfl <- as.list(df)
View(dfl)

jsonlite::toJSON(dfl,dataframe = "columns")

jsonlite::toJSON(dfl,dataframe = "values")

jsonlite::toJSON(dfl,dataframe = "rows")

jsonlite::toJSON(dfl,dataframe = "array")

dfarray <- as.array(df)

dfarray <- as.array(dfl)
dfarray

jsonlite::toJSON(dfarray,dataframe = "columns")

jsonlite::toJSON(dfarray,dataframe = "values")

jsonlite::toJSON(dfarray,dataframe = "rows")

