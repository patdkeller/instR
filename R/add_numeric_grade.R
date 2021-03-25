#' add_numeric_grade
#'
#' @param .data your data
#' @param grade the name of the column housing the letter grades you want to convert
#' @param credits the column housing the number of credits the course is worth
#'
#' @return
#' @export
#'
#' @examples
#' #df%>%
#' #add_numeric_grade(Final_Grade,Credit_hours)
#'
add_numeric_grade<-function(.data,grade,credits){


  grade<-rlang::ensym(grade)
  credits<-rlang::ensym(credits)

  .data%>%
    mutate(Numeric_Grade=stringr::str_replace(!!grade,"#",""))%>%
    mutate(Numeric_Grade=stringr::str_replace(Numeric_Grade,"^",""))%>%
    mutate(Numeric_Grade=ifelse(Numeric_Grade=="A",4,
                                ifelse(Numeric_Grade=="A-",3.7,
                                       ifelse(Numeric_Grade=="B+",3.3,
                                              ifelse(Numeric_Grade=="B",3,
                                                     ifelse(Numeric_Grade=="B-",2.7,
                                                            ifelse(Numeric_Grade=="C+", 2.3,
                                                                   ifelse(Numeric_Grade=="C",2,
                                                                          ifelse(Numeric_Grade=="C-",1.7,
                                                                                 ifelse(Numeric_Grade=="D+",1.3,
                                                                                        ifelse(Numeric_Grade=="D",1,
                                                                                               ifelse(Numeric_Grade=="D-",0.7,
                                                                                                      ifelse(Numeric_Grade=="F",0,
                                                                                                             ifelse(Numeric_Grade=="W",-1000,   ifelse(Numeric_Grade=="",-500,-9000)))))))))))))))%>%
    mutate(Quality_Points=Numeric_Grade*!!credits)
}
