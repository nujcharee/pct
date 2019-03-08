#' Desire lines
#'
#' @param area for which desire lines to be generated.
#' @param n top n number of destinations with most trips in the 2011 census
#' within the `area`.
#'
#' @export
pct_area_desire_lines = function(area = "sheffield", n = 100) {
  if(!exists("area"))
    stop("area is required.")
  if(length(area) != 1L)
    stop("'package' must be of length 1")
  if(is.na(area) || (area == "") || !is.character(area))
    stop("invalid area name")
  # get the census file to read the trip counts
  census_file = file.path(tempdir(), "wu03ew_v2.csv")
  if(!exists(census_file)) {
    utils::download.file("https://s3-eu-west-1.amazonaws.com/statistics.digitalresources.jisc.ac.uk/dkan/files/FLOW/wu03ew_v2/wu03ew_v2.zip",
                  file.path(tempdir(), "wu03ew_v2.zip"))
    utils::unzip(file.path(tempdir(), "wu03ew_v2.zip"), exdir = tempdir())
  }
  od_all = readr::read_csv(census_file)
  # get UK zones with msoa11cd, msoa11nm and the geom for stplanr::od2line
  zones_all = get_centroids_ew() # TODO: some warning?
  zones = zones_all[grepl(area, zones_all$msoa11nm, ignore.case = T), ]

  od_area = od_all[od_all$`Area of residence` %in% zones$msoa11cd &
                     od_all$`Area of workplace` %in% zones$msoa11cd, ]
  od_area = od_area[od_area$`Area of residence` !=
                      od_area$`Area of workplace`, ]
  od_area = od_area[order(od_area$`All categories: Method of travel to work`,
                          decreasing = TRUE),]
  od_area = od_area[1:n,] # subset before heavy processing.
  # generate desirelines.
  area_desire_lines = stplanr::od2line(
    flow = od_area[,c(2,1)], zones)
  area_desire_lines
}