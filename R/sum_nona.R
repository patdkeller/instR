#' sum_nona()
#'
#' take to sum, but ignore na values.  Just a means of reducing arguments.
#'
#' @param ... your data, generally just piped in
#'
#' @return
#' @export
#'
#' @examples
#' #df%>%
#' #sum_nona(Amount)
sum_nona<-function(...){
  sum(...,na.rm=TRUE)

}
