
RegisterBatchDataGavi <- function (diseaseburden_template, gavi_coverage) {

  names(gavi_coverage)[names(gavi_coverage) == 'country'] <- 'country_name'
  names(gavi_coverage)[names(gavi_coverage) == 'country_code'] <- 'country'
  newdat <- merge(diseaseburden_template, gavi_coverage,  by=c("year", "country"), all=TRUE)

  ### output file
  #myvars <- c("disease" , "year" ,"age" ,"country" , "country_name","cohort_size" , "dalys", "cases","deaths")

  .data.batch <- newdat [, c("country","year","coverage","age_first","actvity_type","target","vaccine")]
  return(.data.batch)

}

RegisterBatchDataGavi(diseaseburden_template = diseaseburden_template, gavi_coverage = gavi_coverage)

###############################################################################################################################
###############################################################################################################################

OutputGavi <- function (diseaseburden_template, Inputfile) {

  newdat <- merge(diseaseburden_template, Inputfile,  by=c("year", "country"), all=TRUE)

  .data.batch <- newdat [, c("vaccine","year","age","country","country_name.y","cohort_size","dalys","cases","deaths")]
  return(.data.batch)

}

####OutputGavi(diseaseburden_template = diseaseburden_template, Inputfile = ???)
