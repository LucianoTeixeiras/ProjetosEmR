# Teste de Carga

library(pdftools)
download.file("https://github.com/Huitziii/crispy-pdf/raw/master/71_PV.62.pdf",
              "./71_PV.62.pdf")
text <- pdf_text("./71_PV.62.pdf")

text2 <- strsplit(text, "\n")
head(text2[[1]])

install.packages("tm")

library(tm)
read <- readPDF(control = list(text = "-layout"))

document <- Corpus(URISource("./71_PV.62.pdf"), readerControl = list(reader = read))
doc <- content(document[[1]])
head(doc)
