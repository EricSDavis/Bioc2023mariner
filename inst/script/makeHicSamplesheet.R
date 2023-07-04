## Creating a samplesheet from
## .hic file names

## Paths to .hic files
hicFiles <- 
  list.files("data/hic", full.names=TRUE) |>
  normalizePath()

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

## Add additional info
info <- data.frame(
  sample=paste0("sample", seq_len(nrow(samples))),
  type=c(rep("control", 6), rep("treatment", 6))
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
  file="/home/rstudio/data/samples/samplesheet.txt",
  sep="\t"
)
