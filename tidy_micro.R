#### FUNCTION tidy_micro(micro) ####
# function to clean microclimate model into frequently used dataframes & vectores 
# requires microclimate model as input 
tidy_micro <- function(micro){
  metout <- as.data.frame(micro$metout) # aboveground conditions
  shadmet <- as.data.frame(micro$shadmet) # aboveground conditions, shade
  soilmoist <- as.data.frame(micro$soilmoist) # soil mositure
  shadmoist <- as.data.frame(micro$shadmoist) # soil moisture, shade
  soil <- as.data.frame(micro$soil) # soil temperatures, minimum shade
  shadsoil <- as.data.frame(micro$shadsoil) # soil temperatures, maximum shade
  humid <- as.data.frame(micro$humid) # soil humidity
  shadhumid <- as.data.frame(micro$shadhumid) # soil humidity under max shade
  soilpot <- as.data.frame(micro$soilpot) # soil water potential
  shadpot <- as.data.frame(micro$shadpot) # soil water potential under max shade
  
  # Dates 
  dates <- micro$dates
 
  ## Vectors in input into endotherm model ##
  TAs <- metout$TALOC  # air temperatures at height of animal (°C)
  TAREFs <- metout$TAREF  # air temperatures at reference height (°C)
  TSKYs <- metout$TSKYC  # sky temperatures (°C)
  TGRDs <- soil$D0cm  # surface temperatures (°C)
  VELs <- metout$VLOC  # wind speeds at animal height (m/s)
  RHs <- metout$RHLOC  # relative humidity at animal height (%)
  QSOLRs <- metout$SOLR  # solar radiation (W/m2)
  Zs <- metout$ZEN  # zenith angle of the sun (degrees)
  ELEV <- micro$elev  # elevation (m)
  ABSSB <- 1 - micro$REFL  # substrate solar absorptivity (%)
  
  # Assign to global environment
  # dataframes
  assign("metout", metout, envir = .GlobalEnv)
  assign("shadmet", shadmet, envir = .GlobalEnv)
  assign("soil", soil, envir = .GlobalEnv)
  assign("shadsoil", shadsoil, envir = .GlobalEnv)
  assign("dates", dates, envir = .GlobalEnv)
  assign("humid", humid, envir = .GlobalEnv)
  assign("shadhumid", shadhumid, envir = .GlobalEnv)
  assign("shadmoist", shadmoist, envir = .GlobalEnv)
  assign("soilpot", soilpot, envir = .GlobalEnv)
  assign("shadpot", shadpot, envir = .GlobalEnv)
  
  # Vectors
  assign("TAs", TAs, envir = .GlobalEnv)
  assign("TAREFs", TAREFs, envir = .GlobalEnv)
  assign("TSKYs", TSKYs, envir = .GlobalEnv)
  assign("TGRDs", TGRDs, envir = .GlobalEnv)  
  assign("VELs", VELs, envir = .GlobalEnv)
  assign("RHs", RHs, envir = .GlobalEnv)  
  assign("QSOLRs", QSOLRs, envir = .GlobalEnv)
  assign("Zs", Zs, envir = .GlobalEnv)  
  assign("ELEV", ELEV, envir = .GlobalEnv)
  assign("ABSSB", ABSSB, envir = .GlobalEnv)  
  
  invisible(NULL)   # do not show in console
} 
