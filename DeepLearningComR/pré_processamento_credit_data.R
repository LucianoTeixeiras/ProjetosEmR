# Confere o diretorio de trabalho
getwd()

# Leitura da Base de dados
base = read.csv('credit-data.csv')
head(base)

# Apaga a coluna clienteid
base$clientid = NULL

# Valores inconsistentes
base$age = ifelse(base$age < 0, 40.92, base$age)

# Valores faltantes
base$age = ifelse(is.na(base$age), mean(base$age, na.rm = TRUE), base$age)

# Escalonamento
base[, 1:3] = scale(base[, 1:3])

# Divisão entre treinamento e teste

install.packages('caTools')
library(caTools)
set.seed(1)
divisao = sample.split(base$default, SplitRatio = 0.75)
base_treinamento = subset(base, divisao == TRUE)
base_teste = subset(base, divisao == FALSE)

#Pacote h2o
install.packages("h2o")
library(h2o)
?h2o
h2o.init(nthreads = -1)
classificador = h2o.deeplearning(y = 'default',
                                 training_frame = as.h2o(base_treinamento),
                                 activation = 'Rectifier',
                                 hidden = c(100),
                                 epochs = 1000)

classificador

previsoes = h2o.predict(classificador, newdata = as.h2o(base_teste[-4]))

previsoes

previsoes = (previsoes > 0.5)

previsoes

previsoes = as.vector(previsoes)

previsoes

matriz_confusao = table(base_teste[, 4], previsoes)

matriz_confusao


idade_invalida = base[base$age < 0 & !is.na(base$age), ]
# 1 apagar a coluna inteira
base$age = NULL

# 2 apagar somente os registros com problema
base = base[base$age > 0, ]

# 3 preencher os dados manualmente

# calcular a média da idade
mean(base$age, na.rm = TRUE)
mean(base$age[base$age > 0], na.rm = TRUE)
base$age = ifelse(base$age < 0, 40.92, base$age)

base[is.na(base$age), ]
base$age = ifelse(is.na(base$age), mean(base$age, na.rm = TRUE), base$age)



