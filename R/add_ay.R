#' Add academic year
#'
#' @param .data your data
#' @param term a term field, where the fourth character is the season, and the second and third character represent year.
#'
#' @return
#' @export
#'
#' @examples
#' #df%>%
#' #add_ay(Term)
add_ay<-function(.data,term) {
  term<-rlang::ensym(term)

  .data%>%
    dplyr::mutate(AY=ifelse(substr(!!term,4,4) %in% c("3","4"),
                            paste0(substr(!!term,2,3),"-",as.numeric(substr(!!term,2,3))+1),
                            paste0(as.numeric(substr(!!term,2,3))-1,"-",as.numeric(substr(!!term,2,3)))))
}
