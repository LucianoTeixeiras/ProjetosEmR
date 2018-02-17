#Import Data Frame
dados<-read.csv2("dados.csv", header = TRUE, sep = ";")

View(dados)

summary(dados)

str(dados)

install.packages("lubridate")
install.packages("Rcpp")

library(lubridate)

dados$Data = dmy(dados$Data)

dados2 = dados[month(dados$Data) ==11 & day(dados$Data) == 2,c('Data','Precipitacao')]
#View(dados2)

dados2$Choveu = as.factor(dados2$Precipitacao != 0)

#View(dados2)

str(dados2)

summary(dados2)

#Gerando Grafico

palette(c("blue","red"))
plot(dados2$Data, dados2$Precipitacao, main = "Finados CHove?", xlab = "Ano", ylab = "Precipitação", col = dados2$Choveu)
