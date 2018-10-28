#-----------------------------------------------------------------------------------
#
# Algoritmo Utilizado
#
#-----------------------------------------------------------------------------------

# Naive Bayes

#-----------------------------------------------------------------------------------
#
# Importando a Base de Dados
#
#-----------------------------------------------------------------------------------

base = read.csv('BaseCredito.csv')

#-----------------------------------------------------------------------------------
#
# Eliminando coluna clientid
#
#-----------------------------------------------------------------------------------

base$clientid = NULL

#-----------------------------------------------------------------------------------
#
# Preencher os valores negativos com a média dos valores positivos da coluna Age
#
#-----------------------------------------------------------------------------------

base$age = ifelse(base$age < 0, 40.92, base$age)

#-----------------------------------------------------------------------------------
#
# Preencher os valores nulos
#
#-----------------------------------------------------------------------------------

base$age = ifelse(is.na(base$age), mean(base$age, na.rm = TRUE), base$age)

#-----------------------------------------------------------------------------------
#
# Executando o Escalonamento, transformando os atributos numéricos na mesma escala
# 
#-----------------------------------------------------------------------------------

base[, 1:3] = scale(base[, 1:3])

#-----------------------------------------------------------------------------------
#
# Encode da classe
#
#-----------------------------------------------------------------------------------

base$default = factor(base$default, levels = c(0,1))

#-----------------------------------------------------------------------------------
#
# Executando a divisão da base de dados entre treinamento e teste 
# 
#-----------------------------------------------------------------------------------

library(caTools)
set.seed(1)
divisao = sample.split(base$income, SplitRatio = 0.75)
base_treinamento = subset(base, divisao == TRUE)
base_teste = subset(base, divisao == FALSE)

#-----------------------------------------------------------------------------------
#
# Executando a primeira avaliação atraves da criação do classificador
# 
#-----------------------------------------------------------------------------------

library(e1071)
classificador = naiveBayes(x = base_treinamento[-4], y = base_treinamento$default)
print(classificador)
previsoes = predict(classificador, newdata = base_teste[-4])

#-----------------------------------------------------------------------------------
#
# Executando a verificação do índice de acertos
#
#-----------------------------------------------------------------------------------

matriz_confusao = table(base_teste[, 4], previsoes)
print(matriz_confusao)
install.packages('caret')
library(caret)
confusionMatrix(matriz_confusao)

# ZeroR 
table(base_teste$default)

#-----------------------------------------------------------------------------------
#
# Algoritmo Utilizado
#
#-----------------------------------------------------------------------------------

# Regressão Logística

#-----------------------------------------------------------------------------------
#
# Importando a Base de Dados
#
#-----------------------------------------------------------------------------------

base = read.csv('BaseCredito.csv')

#-----------------------------------------------------------------------------------
#
# Eliminando coluna clientid
#
#-----------------------------------------------------------------------------------

base$clientid = NULL

#-----------------------------------------------------------------------------------
#
# Preencher os valores negativos com a média dos valores positivos da coluna Age
#
#-----------------------------------------------------------------------------------

base$age = ifelse(base$age < 0, 40.92, base$age)

#-----------------------------------------------------------------------------------
#
# Preencher os valores nulos
#
#-----------------------------------------------------------------------------------

base$age = ifelse(is.na(base$age), mean(base$age, na.rm = TRUE), base$age)

#-----------------------------------------------------------------------------------
#
# Executando o Escalonamento, transformando os atributos numéricos na mesma escala
#
#-----------------------------------------------------------------------------------

base[, 1:3] = scale(base[, 1:3])

#-----------------------------------------------------------------------------------
#
# Executando a divisão da base de dados entre treinamento e teste 
# 
#-----------------------------------------------------------------------------------

library(caTools)
set.seed(1)
divisao = sample.split(base$income, SplitRatio = 0.75)
base_treinamento = subset(base, divisao == TRUE)
base_teste = subset(base, divisao == FALSE)

#-----------------------------------------------------------------------------------
#
# Executando a primeira avaliação atraves da criação do classificador
# 
#-----------------------------------------------------------------------------------

classificador = glm(formula = default ~ ., family = binomial, data = base_treinamento)
probabilidades = predict(classificador, type = 'response', newdata = base_teste[-4])
previsoes = ifelse(probabilidades > 0.5, 1, 0)

#-----------------------------------------------------------------------------------
#
# Executando a verificação do índice de acertos
#
#-----------------------------------------------------------------------------------

matriz_confusao = table(base_teste[, 4], previsoes)
print(matriz_confusao)
library(caret)
confusionMatrix(matriz_confusao)

# ZeroR 
table(base_teste$default)

#-----------------------------------------------------------------------------------
#
# Algoritmo Utilizado
#
#-----------------------------------------------------------------------------------

# Árvore de Decisão

#-----------------------------------------------------------------------------------
#
# Importando a Base de Dados
#
#-----------------------------------------------------------------------------------

base = read.csv('BaseCredito.csv')

#-----------------------------------------------------------------------------------
#
# Eliminando coluna clientid
#
#-----------------------------------------------------------------------------------

base$clientid = NULL

#-----------------------------------------------------------------------------------
#
# Preencher os valores negativos com a média dos valores positivos da coluna Age
#
#-----------------------------------------------------------------------------------

base$age = ifelse(base$age < 0, 40.92, base$age)

#-----------------------------------------------------------------------------------
#
# Preencher os valores nulos
#
#-----------------------------------------------------------------------------------

base$age = ifelse(is.na(base$age), mean(base$age, na.rm = TRUE), base$age)

#-----------------------------------------------------------------------------------
#
# Executando o Escalonamento 
# Transformando todos os atributos numéricos na mesma escala
#-----------------------------------------------------------------------------------

base[, 1:3] = scale(base[, 1:3])

#-----------------------------------------------------------------------------------
#
# Encode da classe
#
#-----------------------------------------------------------------------------------

base$default = factor(base$default, levels = c(0,1))

#-----------------------------------------------------------------------------------
#
# Executando a divisão da base de dados entre treinamento e teste 
# 
#-----------------------------------------------------------------------------------

library(caTools)
set.seed(1)
divisao = sample.split(base$income, SplitRatio = 0.75)
base_treinamento = subset(base, divisao == TRUE)
base_teste = subset(base, divisao == FALSE)

#-----------------------------------------------------------------------------------
#
# Executando a primeira avaliação atraves da criação do classificador
# 
#-----------------------------------------------------------------------------------

library(rpart)
classificador = rpart(formula = default ~ ., data = base_treinamento)
print(classificador)
library(rpart.plot)
rpart.plot(classificador)

#-----------------------------------------------------------------------------------
#
# Executando a verificação do índice de acertos
#
#-----------------------------------------------------------------------------------

previsoes = predict(classificador, newdata = base_teste[-4], type = 'class')
matriz_confusao = table(base_teste[, 4], previsoes)
print(matriz_confusao)
library(caret)
confusionMatrix(matriz_confusao)
