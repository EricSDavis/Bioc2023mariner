# Bioc2023mariner

This is a workshop package for BioC2023, showing how to use
`mariner` and `plotgardener` to analyze and visualize Hi-C data.
If you are browsing on GitHub, see here for the workshop homepage:

<https://ericsdavis.github.io/Bioc2023mariner>

## Workshop material

For the workshop content, see the **Get started** tab above. 

The **References** tab has short descriptions of the datasets.

## Run with docker:

Pull latest docker image:

```sh
docker pull ghcr.io/ericsdavis/bioc2023mariner:latest
```

Run container:

```sh
docker run -e PASSWORD=<CHOOSE_PASSWORD> -p 8787:8787 ericsdavis/bioc2023mariner
```

Once running, navigate to http://localhost:8787/ and then login with
`rstudio`:`yourchosenpassword`.
