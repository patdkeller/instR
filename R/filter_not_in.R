filter_not_in<-function(.data,OtherDf,columnInData,columnInOtherDf){

  columnInData<-rlang::ensym(columnInData)
  columnInOtherDf<-rlang::ensym(columnInOtherDf)

  .data%>%
    filter({stopifnot(exists(as.character(columnInOtherDf), where = otherdf)); !(!!columnInData %in% otherdf[,names(otherdf) %in% c(columnInOtherDf)])})
}
