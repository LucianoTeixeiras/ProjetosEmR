# run on old computer / r version
setwd("~/GitHub/ProjetosEmR/CopyInstalledPackages")
packages <- installed.packages()[,"Package"]
save(packages, file="packages-LTS-02")


# run on new computer / r version
setwd("~/GitHub/ProjetosEmR/CopyInstalledPackages")
getwd()
load("Rpackages")
for (p in setdiff(packages, installed.packages()[,"Package"]))
install.packages(p)
