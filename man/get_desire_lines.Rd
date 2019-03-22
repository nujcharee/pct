% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/desire_lines.R
\name{get_desire_lines}
\alias{get_desire_lines}
\title{Desire lines}
\usage{
get_desire_lines(area = "sheffield", n = 100)
}
\arguments{
\item{area}{for which desire lines to be generated.}

\item{n}{top n number of destinations with most trips in the 2011 census
within the \code{area}.}
}
\description{
This function generates "desire lines" from census 2011 data.
}
\examples{
desire_sheffield = get_desire_lines("sheffield", n = 20)
desire_sheffield
}