% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/desire_lines.R
\name{get_od}
\alias{get_od}
\title{Get origin destination data from the 2011 Census}
\usage{
get_od(area = NULL, n = NULL, type = "within",
  omit_intrazonal = FALSE)
}
\arguments{
\item{area}{for which desire lines to be generated.}

\item{n}{top n number of destinations with most trips in the 2011 census
within the \code{area}.}

\item{type}{the type of subsetting: one of \code{from}, \code{to} or \code{within}, specifying how
the od dataset should be subset in relation to the \code{area}.}

\item{omit_intrazonal}{should intrazonal OD pairs be omited from result?
\code{FALSE} by default.}
}
\description{
Get origin destination data from the 2011 Census
}
\examples{
\donttest{
get_od("wight", n = 3)
}
}
