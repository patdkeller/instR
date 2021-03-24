#' Title
#'
#' @param df data that you are wanting to output a nice table for
#'
#' @return
#' @export
#'
#' @examples
#' #output_datatable(df)
output_datatable<-function(df){

  DT::datatable(df,extensions='Buttons',rownames=FALSE,filter=c("top"),options=list(dom='Bfrtip',buttons=c('copy','csv','excel')))
}
