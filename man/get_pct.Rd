% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_pct.R
\name{get_pct}
\alias{get_pct}
\title{Generic function to get regional data from the PCT}
\usage{

  get_pct(base_url = "https://github.com/npct/pct-outputs-regional-R/raw/master",
  purpose = "commute", geography = "msoa", region = NULL,
  layer = NULL, extension = ".Rds", national = FALSE)
}
\arguments{
\item{base_url}{Where the data is stored.}

\item{purpose}{Trip purpose (typically \code{school} or \code{commute})}

\item{geography}{Geographic resolution of outputs (\code{msoa} or \code{lsoa})}

\item{region}{The PCT region that contains the data (e.g. \code{west-yorkshire})}

\item{layer}{The PCT layer of interest, \code{z}, \code{c}, \code{l}, \code{rf}, \code{rq} or \code{rnet}
for zones, centroids, desire lines, routes (fast or quiet) and route networks, respectively}

\item{extension}{The type of file to download (typically \code{.Rds})}

\item{national}{Download nationwide data? \code{FALSE} by default}
}
\description{
This function gets data generated for the Propensity to Cycle Tool
project and returns objects in the modern \code{sf} class.
}
\examples{
rf = get_pct(region = "isle-of-wight", layer = "rf")
names(rf)[1:20]
vars_to_plot = 10:13
plot(rf[vars_to_plot])
z = get_pct(region = "isle-of-wight", layer = "z")
# rf = get_pct(region = "west-yorkshire", layer = "rf")
# z_all = get_pct(layer = "z", national = TRUE)
}
