# functions.R - This file includes some functions used in the UNIVACr model.


#' Simulation log reporting
#'
#' Appends message of simulation run (\code{x}) to log file (\code{logname}).
#'
#' @param logname log filename
#' @param x message of simulation run
#'
#' @return None
#' @export
#'
#' @examples #
writelog <- function (logname, x) {

  # wait until log file is yours
  Sys.sleep (0.02)

  while ((file.exists(paste0(logname,"_locked"))))
  {Sys.sleep(0.02)}

  # lock log file
  file.create (paste0(logname,"_locked"))

  # write to log file
  write ( paste0 (format(Sys.time(), "%Y/%m/%d %H:%M:%S"), " ", x), file=logname, append=TRUE )

  # unlock log file
  file.remove (paste0 (logname,"_locked") )
}
