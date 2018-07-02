# Leitora de PDF em R

install.packages("pdftools")

library(pdftools)

pdffile <- ("estatisticas_cad_est_2016.pdf")

View(pdffile)


dest <- "~/A1.pdf"

# set path to pdftotxt.exe and convert pdf to text
exe <- "C:/Program Files (x86)/xpdfbin-win-3.03/bin32/pdftotext.exe"
system(paste("\"", exe, "\" \"", dest, "\"", sep = ""), wait = F)

# get txt-file name and open it
filetxt <- sub(".pdf", ".txt", dest)
shell.exec(filetxt)





library(pdftools)
#download.file("http://servicos.educacao.rs.gov.br/dados/estatisticas_cad_est_2016.pdf","./estatisticas_cad_est_2016.pdf")

text <- pdf_text("estatisticas_cad_est_2016.pdf")

View(text)
