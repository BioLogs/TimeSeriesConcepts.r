
# Required packages :
library(rmarkdown)

# List of files to render :
rmd.files <- unlist(lapply(dir("src"), function(x){ file.path("src", x) }))
# Render only to html, ommit md :
render.to.html <- function(x){
  render(x, output_dir = "build")
}
# Execute, assign to `renderd` to avoid unnecessary verbosity : 
rendered <- lapply(rmd.files, render.to.html)

## END