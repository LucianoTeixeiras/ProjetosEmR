# WordCloud - Nuvem de Palavras

# Instalando as Bibliotecas
install.packages("tm")
install.packages("SnowballC")
install.packages("wordcloud")

# Carregando as Bibliotecas
library(tm)
library(SnowballC)
library(wordcloud)

# Load do Data Frame
aux<- read.csv2("http://www.estatisticacomr.uff.br/wp-content/uploads/2015/07/acidentes.csv")

# Criando um corpus
auxCorpus <- Corpus(VectorSource(aux))

# Converter o corpus em um documento de texto simples.
auxCorpus <- tm_map(auxCorpus, PlainTextDocument)

# Remover toda a pontuação e palavras irrelevantes
auxCorpus <- tm_map(auxCorpus, removePunctuation) 

auxCorpus <- tm_map(auxCorpus, removeWords, stopwords('pt')) 

# Verificar as palavras e seus sinônimos
auxCorpus <- tm_map(auxCorpus, stemDocument)

# Criando a wordcloud
wordcloud(auxCorpus,max.words=50,colors=c("blue","red"))


# Ledo outro arquivo
nuvem = read.csv(file.choose(), header =T, sep = ";")

library(readr)
nuvem <- read_delim("~/GitHub/ProjetosEmR/WordCloud/frequencia.csv", 
                         ";", escape_double = FALSE, trim_ws = TRUE)
View(nuvem)

# WordCloud 01
wordcloud(words = nuvem$palavra, freq = nuvem$frequencia)

# WordCloud 02

wordcloud(words = nuvem$palavra, 
          freq = nuvem$frequencia,min.freq = 1, 
          random.order = TRUE,
          colors=brewer.pal(8,'Dark2'), 
          use.r.layout=TRUE, 
          rot.per= 0.1)
