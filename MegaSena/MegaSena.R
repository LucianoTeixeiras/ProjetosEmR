#
library(readxl)
D_megase <- read_excel("MegaSena/D_megase.xlsx")
head(D_megase)
D_megase


D_megase <- read_excel("D_megase.xlsx", col_types = c("numeric", 
                                                      "numeric", "numeric", "numeric", "numeric", 
                                                      "numeric", "numeric", "numeric", "skip", 
                                                      "numeric", "skip", "skip", "skip", 
                                                      "skip", "skip", "skip", "skip", "skip", 
                                                      "skip", "skip", "skip"))

class(D_megase)

D_megase
summary(D_megase)

megasena <- D_megase(D_megase[8!=0])
