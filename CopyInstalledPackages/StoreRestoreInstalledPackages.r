# store_packages.R
#
# stores a list of your currently installed packages

tmp = installed.packages()

installedpackages = as.vector(tmp[is.na(tmp[,"Priority"]), 1])
save(installedpackages, file="~/GitHub/ProjetosEmR/CopyInstalledPackages/installed_packages-RAPD.rda")


# restore_packages.R
#
# installs each package from the stored list of packages

load("~/GitHub/ProjetosEmR/CopyInstalledPackages/installed_packages-RAPD.rda")

for (count in 1:length(installedpackages)) install.packages(installedpackages[count])
