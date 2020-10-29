
# Required packages :
library(rmarkdown)
library(RcppTOML)
library(glue)

# Parse configuration :
config <- parseToml("config.toml")
Sys.setenv(RSTUDIO_PANDOC=config$paths$pandoc)
Sys.setenv(pdflatex=config$paths$pdflatex)

# List of files to render :
rmd.files <- Sys.glob(glue::glue("{config$directories$source}*.Rmd"))
## Legacy :
#rmd.files <- unlist(lapply(dir(config$directories$source), function(x){ file.path("src", x) }))

if (config$options$verbose){
    print(glue::glue("RSTUDIO_PANDOC -> {Sys.getenv('RSTUDIO_PANDOC')}"))
    print(glue::glue("pdflatex -> {Sys.getenv('pdflatex')}"))
    print(glue::glue("which pdflatex -> {Sys.which('pdflatex')}"))
}

# Render only to html, ommit md :
render.to.html <- function(x){
  render(x, output_dir = config$directories$dest, output_format=config$options$output)
}

# Execute, assign to `rendered` to avoid unnecessary verbosity : 
rendered <- lapply(rmd.files, render.to.html)

## END
