# run on old computer
#
# r version

setwd("~/GitHub/ProjetosEmR/CopyInstalledPackages")

packages <- installed.packages()[,"Package"]

packages

save(packages, file="Packages")

# run on new computer
#
# r version

setwd("~/GitHub/ProjetosEmR/CopyInstalledPackages")

getwd()

load("Packages")

for (p in setdiff(packages, installed.packages()[,"Package"]))

install.packages(p, dependencies = TRUE)
