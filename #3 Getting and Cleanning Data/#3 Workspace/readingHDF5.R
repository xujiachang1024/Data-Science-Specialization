## R HDF5 Package
#source("http://bioconductor.org/biocLite.R")
#biocLite("rhdf5")
library(rhdf5)
#created <- h5createFile("example.h5")



## Create groups
#created <- h5createGroup("example.h5", "foo")
#created <- h5createGroup("example.h5", "baa")
#created <- h5createGroup("example.h5", "foo/foobaa")
print(h5ls("example.h5"))