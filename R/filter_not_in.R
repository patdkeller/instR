#' Title
#'
#' When you are looking to filter out items that appear in another dataframe,
#' negating an %in% filter returns all records if you mistakenly refer to a column that
#' does not exist in the comparison dataframe.  This function protects against code
#' running smoothly and the risk of missing the mistake by throwing an error.
#'
#'
#' @param .data your dataframe
#' @param OtherDf another data frame that you are comparing records with
#' @param columnInData the column in your original dataframe that will be the basis of the filter
#' @param columnInOtherDf the corresponding column found in the dataframe that you are comparing to
#'
#' @return
#' @export
#'
#' @examples
#'
#' Say you have a dataframe named otherdata with a list of students you want omitted from your data,
#' but mistakenly refer to the ID column in otherdata as ID, when the name in otherdata is Student_ID.
#' #data%>%
#' #filter(!(ID %in% otherdata$ID))
#'
#' The above will run, but no filtering would take place.  No IDs appear in a column that doesn't exist,
#' so filter() is happy to give you your original data back!  There is no check in place to ensure that otherdata$ID is even there!
#'
#' With this function,
#'
#' #data%>%
#' #filter_not_in(otherdf,ID,ID)
#'
#' fails! Protecting from this type of error.
#'
#' #data%>%
#' #filter_not_in(otherdata,ID,Student_ID)
filter_not_in<-function(.data,OtherDf,columnInData,columnInOtherDf){

  columnInData<-rlang::ensym(columnInData)
  columnInOtherDf<-rlang::ensym(columnInOtherDf)

  .data%>%
    filter({stopifnot(exists(as.character(columnInOtherDf), where = otherdf)); !(!!columnInData %in% otherdf[,names(otherdf) %in% c(columnInOtherDf)])})
}
