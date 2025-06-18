# extract_endo() function generates data frames of interest from output of the endotherm model in NicheMapR
# requires endo.out as input
# generates dfs: treg, morph, enbal, masbal 
# assigns dfs to global environment

extract_endo <- function(endo.out){
  # extract the output
  endo.out1 <- do.call("rbind", lapply(endo.out, data.frame))
  # thermoregulation output
  treg <- endo.out1[, grep(pattern = "treg", colnames(endo.out1))]
  colnames(treg) <- gsub(colnames(treg), pattern = "treg.", replacement = "")
  # morphometric output
  morph <- endo.out1[, grep(pattern = "morph", colnames(endo.out1))]
  colnames(morph) <- gsub(colnames(morph), pattern = "morph.",
                          replacement = "")
  # heat balance
  enbal <- endo.out1[, grep(pattern = "enbal", colnames(endo.out1))]
  colnames(enbal) <- gsub(colnames(enbal), pattern = "enbal.",
                          replacement = "")
  # mass aspects
  masbal <- endo.out1[, grep(pattern = "masbal", colnames(endo.out1))]
  colnames(masbal) <- gsub(colnames(masbal), pattern = "masbal.",
                           replacement = "")
  assign("treg", treg, envir = .GlobalEnv)
  assign("morph", morph, envir = .GlobalEnv)  
  assign("enbal", enbal, envir = .GlobalEnv)
  assign("masbal", masbal, envir = .GlobalEnv)  
  invisible(NULL)   # do not show in console
}
