# run on old computer / r version
setwd("C:/Temp/") # or any other existing temp directory
setwd("/Users/Florian/Dropbox/temp")
packages <- installed.packages()[,"Package"]
save(packages, file="Rpackages")


# run on new computer / r version
setwd("C:/Temp/") # or any other existing temp directory
load("Rpackages")
for (p in setdiff(packages, installed.packages()[,"Package"]))
install.packages(p)