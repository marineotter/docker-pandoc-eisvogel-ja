# docker-pandoc-eisvogel-ja

![Build and Push](https://github.com/marineotter/docker-pandoc-eisvogel-ja/actions/workflows/build.yaml/badge.svg?branch=master)

Pandoc docker image with [eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template) template for Japanese.

> **Note:** This is a fork of the original repository. Docker images are published to GitHub Container Registry (GHCR).

## Usage

### Basic Usage

```console
$ docker run --rm -v $(pwd):/data ghcr.io/marineotter/pandoc-eisvogel-ja \
    -o doc.pdf \
    doc.md
```

### Fonts

The following Japanese fonts are supported.

- haranoaji (default)
- ipa
- ipaex

It can be specified with a `luatexjapresetoptions` variable.

```console
$ docker run --rm -v $(pwd):/data ghcr.io/marineotter/pandoc-eisvogel-ja \
    -V luatexjapresetoptions=ipaex \
    -o doc.pdf \
    doc.md
```

### PlantUML

The `plantuml` tag supports [PlantUML](https://plantuml.com/) using [timofurrer/pandoc-plantuml-filter](timofurrer/pandoc-plantuml-filter).

```console
$ docker run --rm -v $(pwd):/data ghcr.io/marineotter/pandoc-eisvogel-ja:plantuml \
    -o doc.pdf \
    doc.md
```

## Examples

See [examples](./examples) directory.
