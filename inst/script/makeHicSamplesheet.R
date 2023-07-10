## Creating a samplesheet from
## .hic file names

## Paths to .hic files
hicFiles <- 
  list.files("vignettes/data/hic", full.names=TRUE) |>
  gsub("vignettes/", "", x=_)

## Split by filename & format as data.frame
samples <- 
  hicFiles |>
  basename() |>
  strsplit("_") |>
  do.call(rbind, args=_) |>
  {\(x) x[,1:3]}() |>
  `colnames<-`(c("PMAtreatment", "biorep", "techrep")) |>
  apply(2, as.factor) |>
  as.data.frame()

## Remove bio/tech rep for workshop examples
samples$biorep <- NULL
samples$techrep <- NULL

## Add additional info
info <- data.frame(
  sample=paste0("sample", seq_len(nrow(samples))),
  condition=c(rep("control", 6), rep("treatment", 6)),
  replicate=c(1:6, 1:6)
)

## Add filepath
filepath <- data.frame(
  filepath=hicFiles
)

## Join into samplesheet
samplesheet <- cbind(info, samples, filepath)

## Write out results
write.table(
  x=samplesheet,
  file="/home/rstudio/Bioc2023mariner/vignettes/data/samples/samplesheet.txt",
  sep="\t"
)
