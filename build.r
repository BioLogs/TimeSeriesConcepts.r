
# Make rendering ez :
library(ezknitr)

# List of files to render :
rmd.files <- unlist(lapply(dir("src"), function(x){ file.path("src", x) }))
# Render only to html, ommit md :
render.to.html <- function(x){
  ezknit(file = x, out_dir = "build", keep_md = FALSE)
}
# Execute, assign to `renderd` to avoid unnecessary verbosity : 
rendered <- lapply(rmd.files, render.to.html)
