FROM bioconductor/bioconductor_docker:latest

# Install additional R packages for workshop
RUN R -e "remotes::install_github('EricSDavis/mariner@dev', dependencies=TRUE)"
RUN R -e "BiocManager::install(c('DESeq2'))"
RUN R -e "remotes::install_github('azhu513/apeglm')"
RUN R -e "install.packages('aws.s3')"

# Set working directory
WORKDIR /home/rstudio/

# Copy files to docker image
COPY --chown=rstudio:rstudio --chmod=777 . Bioc2023mariner/

# Install workshop as package
RUN Rscript -e "remotes::install_local('Bioc2023mariner', build_vignettes=TRUE)"
