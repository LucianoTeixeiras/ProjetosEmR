# Mapeando a abertura de escolas municipais em São Paulo ao longo dos anos com um GIF
# http://sillasgonzaga.com/post/mapeando-a-abertura-de-escolas-municipais-em-sao-paulo-ao-longo-dos-anos/

# Pacotes a Instalar

install.packages(c("tidyverse", "ggmap", "gganimate", "lubridate"))

# Pacotes a Carregar

library(tidyverse)
library(ggmap)
library(gganimate)
library(lubridate)
library(readr)

# definir locale para lidar com caracteres especiais

lcl <- locale(encoding = "ISO-8859-1")

df <- read_csv2("escolasr34dez2017.csv", locale = lcl)


df <- read_delim("escolasr34dez2017.csv", ";", escape_double = FALSE, trim_ws = TRUE)

View(escolasr34dez2017)

# Dimensoes do dataset

dim(df)


df <- df %>% 
  select(DATA = DT_CRIACAO, LAT = LATITUDE, LON = LONGITUDE)

knitr::kable(head(df))




converter_mes <- function(x){
  nomes <- c("jan", "fev", "mar", "abr", "mai", "jun",
             "jul", "ago", "set", "out", "nov", "dez")
  
  numeros <- str_pad(1:12, width = 2, pad = "0")
  
  x <- str_replace_all(x, nomes[1], numeros[1])
  x <- str_replace_all(x, nomes[2], numeros[2])
  x <- str_replace_all(x, nomes[3], numeros[3])
  x <- str_replace_all(x, nomes[4], numeros[4])
  x <- str_replace_all(x, nomes[5], numeros[5])
  x <- str_replace_all(x, nomes[6], numeros[6])
  x <- str_replace_all(x, nomes[7], numeros[7])
  x <- str_replace_all(x, nomes[8], numeros[8])
  x <- str_replace_all(x, nomes[9], numeros[9])
  x <- str_replace_all(x, nomes[10], numeros[10])
  x <- str_replace_all(x, nomes[11], numeros[11])
  x <- str_replace_all(x, nomes[12], numeros[12])
  
  x
  
}


df <- df %>% 
  mutate(DATA_CLEAN = dmy(converter_mes(DATA)),
         LAT = LAT/1e6,
         LON = LON/1e6
  ) %>% 
  mutate(ANO = year(DATA_CLEAN)) %>% 
  # remover linhas onde LAT ou LON é NA
  na.omit()

summary(df)


df <- df %>% 
  mutate(ANO = if_else(ANO > year(today()), ANO - 100, ANO))


df %>% 
  count(ANO) %>% 
  ggplot(aes(x = ANO, y = n)) + 
  geom_col(fill = "darkorange1") + 
  theme_minimal() +
  labs(x = NULL, y = NULL,
       title = "Quantidade de escolas fundadas por ano em São Paulo") +
  scale_x_continuous(breaks = scales::pretty_breaks(n = 10))


# Criando o Mapa

# para o centro de sp, usei as coordenadas da praca da se, que peguei no google maps
praca_se <- c(lon = -46.634123, lat = -23.548408)
# o zoom é calculado pela funcao calc_zoom do ggmap
zoom_sp <- calc_zoom(lon = LON, lat = LAT, data = df)

mapa_sp <- get_map(location = praca_se,
                   zoom = zoom_sp,
                   maptype = "toner-lite")

ggmap(mapa_sp) +
  # plotar praça da sé
  geom_point(x = praca_se[1], y = praca_se[2], color = "red")

ggmap(mapa_sp) +
  geom_point(data = df, aes(x = LON, y = LAT),
             color = "red", alpha = 0.1)


ggmap(mapa_sp) +
  geom_density2d(data = df, aes(x = LON, y = LAT),
                 color = "red")


p <- ggmap(mapa_sp) +
  geom_point(data = df,
             aes(x = LON, y = LAT, frame = ANO,
                 cumulative  = TRUE), color = "red", alpha = 0.1) + 
  labs(x = NULL, y = NULL, title = "Escolas em São Paulo em ")
