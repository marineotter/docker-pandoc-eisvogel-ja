# Basics

## Build

```console
$ docker run --rm -v $(pwd):/data ghcr.io/marineotter/pandoc-eisvogel-ja \
    -d config.yaml \
    -o doc.pdf \
    doc.md
```
