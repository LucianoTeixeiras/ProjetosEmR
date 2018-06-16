# run on old computer / r version
setwd("~/GitHub/ProjetosEmR/CopyInstalledPackages")
packages <- installed.packages()[,"Package"]

packages

save(packages, file="Packages-LTS-02")


# run on new computer / r version
setwd("~/GitHub/ProjetosEmR/CopyInstalledPackages")
getwd()
load("Packages-LTS-02")
for (p in setdiff(packages, installed.packages()[,"Package"]))
install.packages(p)
