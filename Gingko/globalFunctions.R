# get a formatted string of the timestamp (exclude colons as they are invalid
# characters in Windows filenames)
humanTime <- function() {
  format(Sys.time(), "%Y%m%d-%H%M%OS")
}

# add an asterisk to an input label to show it is mandatory
labelMandatory <- function(label) {
  tagList(
    label,
    span("*", class = "mandatory_star")
  )
}
