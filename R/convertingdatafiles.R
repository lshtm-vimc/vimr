library(rio)

setwd("/Users/AD/Dropbox/MEEV/2. UNIVAC/1. Recoding to R/univacr")
age.specific.fert<- import("/Users/AD/Downloads/201810synthetic-2_dds-201710_as_fert_both.csv")
export(age.specific.fert, "age.specific.fert.rds")

