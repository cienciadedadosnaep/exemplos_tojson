library(jsonlite)
library(rjson)
library(RJSONIO)

#### Criacao de vetores
# anos em caracter pois o grafico gerado sera o de barras
ano <- c('2012','2013','2014','2015')
MatchaLatte<- c(41.1, 30.4, 65.1, 53.3)
MilkTea<- c(86.5, 92.1, 85.7, 83.1)
CheeseCocoa<-c(24.1, 67.2, 79.5, 86.4)

#### Criacao do data frame
df <- data.frame(ano,MatchaLatte,MilkTea,CheeseCocoa)
# traposicao do df (pois eh necessario usar o nome das variaveis como tag)
dft <- t(df)

#### Inclusão dos nomes das variaveis no data frame
dft_n<- data.frame(as.character(row.names(dft)),dft)
# renomeacao das variaveis
names(dft_n) <- c("X0","X1","X2","X3","X4")

#### Transformacao das colunas 2, 3, 4 e 5 em numericas
library(dplyr)
dft_n<- dft_n %>% mutate(across(c(2,3,4,5), as.numeric))
# remocao dos indices
    rownames(dft_n)<-NULL
    
# teste     
teste5<-  jsonlite::toJSON(dft_n,dataframe = "values")    
teste5
##########################################################    

#### Criacao apenas da linha ano
dft_nlanos <- dft_n[1,]
names(dft_nlanos) <- NULL 
dft_nlanos <- as.character(dft_nlanos)

### data frame das variaveis excluindo ano
dft_nl <-  dft_n[-c(1),]

# lista de 2 data frames (anos em caracter + outras variaveis como numericas)
teste6 <- list(dft_nlanos,dft_nl)
    
# teste em json    
teste7<- jsonlite::toJSON(teste6,dataframe = "values")    

# manupilacao para remocao de expressoes regulares (ex. caracteres especiais)
teste8 <- gsub('\\[\\[','[',teste7)
teste9 <- gsub('\\]\\]\\]',']',teste8)
teste9 


data_serie <- paste('[',teste9,']',sep = '')
data_serie_mod <- gsub('\\\"','"',data_serie)

library(stringr)
