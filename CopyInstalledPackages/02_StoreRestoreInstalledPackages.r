# store_packages.R
#
# stores a list of your currently installed packages

tmp = installed.packages()

installedpackages = as.vector(tmp[is.na(tmp[,"Priority"]), 1])
save(installedpackages, file="~/GitHub/ProjetosEmR/CopyInstalledPackages/Packages-LTS-02.rda")


# restore_packages.R
#
# installs each package from the stored list of packages

load("~/GitHub/ProjetosEmR/CopyInstalledPackages/packages-LTS-02.rda")

for (count in 1:length(installedpackages)) install.packages(installedpackages[count])
