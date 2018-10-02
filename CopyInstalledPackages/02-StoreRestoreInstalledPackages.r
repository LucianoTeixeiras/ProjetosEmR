# store_packages.R
#
# stores a list of your currently installed packages

tmp = installed.packages()

installedpackages = as.vector(tmp[is.na(tmp[,"Priority"]), 1])

installedpackages

save(installedpackages, file="~/GitHub/ProjetosEmR/CopyInstalledPackages/Packages.rda")

# restore_packages.R
#
# installs each package from the stored list of packages

load("~/GitHub/ProjetosEmR/CopyInstalledPackages/Packages.rda")

for (count in 1:length(installedpackages)) install.packages(installedpackages[count],dependencies = TRUE)
