
#' percentage
#'
#' @param ...
#' @param digits the number of digits to round your percentage to
#' @param symbol the symbol you'd like to use, if any (generally %)
#'
#' @return
#' @export
#'
#' @examples
#' #percentage(.74621,digits=2,symbol="%")
#'
percentage<-function(...,digits,symbol=NULL){

    #digits<-rlang::ensym(digits)
  if(!(is.null(symbol))){

    paste0(round(...,(digits+2))*100,symbol)

  }
else

{ paste0(round(...,(digits+2))*100)}

}



