#' Add Degree Level
#'
#'
#' This simplifies degree codes to make all associate-level awards one category.
#' Adds a column named DegreeLevel
#'
#' @param .data your data
#' @param degree field housing the degree code
#'
#' @return
#' @export
#'
#' @examples
#' #df%>%
#' #add_degree_level(Degree)
add_degree_level<-function(.data,degree){

  degree<-rlang::ensym(degree)

  .data%>%
    dplyr::mutate(DegreeLevel=ifelse(!!degree %in% c("AA","AS","AAS"),"Associate",
                                     ifelse(!!degree =="CERT","Certificate",
                                            ifelse(!!degree=="0","NonDegree","Unknown"))))
}
