#' Title
#'
#' @param x number to be rounded
#' @param roundTo a number to round to "the closest of"
#' @param dir optional directional argument. "Up" always rounds up, "Down" always rounds down
#'
#' @return
#' @export
#'
#' @examples
#' #round_better(7924,1000,"Up")
#' #round_better(7924,11)
round_better <- function(x, roundTo, dir = NULL) {


  if(is.null(dir)){
    if((roundTo - x %% roundTo) <= x %% roundTo) { x + (roundTo - x %% roundTo)}
    else { x - (x %% roundTo)}}
  else if(dir == "Up") {  ##ROUND UP
    x + (roundTo - x %% roundTo)
  } else if (dir == "Down")
  {  ##ROUND DOWN
    x - (x %% roundTo)
  }
  else {print("Options are Up, Down, and blank.")}

}
