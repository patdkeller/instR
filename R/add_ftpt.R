#' Add full-time/part-time
#'
#' @param .data your data
#' @param ftpt the column holding your various
#'
#' @return
#' @export
#'
#' @examples
#' #dataset%>%
#' #add_ftpt(Full_Part)
add_ftpt<-function(.data,ftpt){

  ftpt<-rlang::ensym(ftpt)

  .data%>%
    dplyr::mutate(FTPT=ifelse(!!ftpt=="FT","FullTime",ifelse(!!ftpt %in% c("HT","QT","PT"),"PartTime","Undefined")))
}
