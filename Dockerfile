ARG pandoc_version="3.8.3-alpine"
FROM pandoc/latex:${pandoc_version}

ARG pandoc_version

RUN tlmgr option repository ftp://tug.org/historic/systems/texlive/2025/tlnet-final \
    && tlmgr install adjustbox \
    babel-japanese \
    background \
    collectbox \
    everypage \
    footmisc \
    footnotebackref \
    fvextra \
    luatexja \
    ly1 \
    mdframed \
    mweights \
    needspace \
    pagecolor \
    sourcecodepro \
    sourcesanspro \
    titling \
    zref \
    haranoaji \
    ipaex \
    koma-script \
    environ \
    tcolorbox \
    tikzfill

RUN apk add --no-cache font-ipaex python3 py3-pip chromium
RUN pip3 install --break-system-packages --no-cache-dir pandocfilters jinja2
RUN ln -sf python3 /usr/bin/python

RUN adduser -h /home/pandocuser -D pandocuser

RUN mkdir -p /home/pandocuser/.pandoc/templates
RUN mkdir -p /home/pandocuser/.pandoc/defaults
RUN mkdir -p /home/pandocuser/.pandoc/filters
RUN mkdir /temp && chown pandocuser /temp

ARG eisvogel_version="3.4.0"
RUN mkdir -p /home/pandocuser/.pandoc/templates \
    && wget https://github.com/Wandmalfarbe/pandoc-latex-template/releases/download/v${eisvogel_version}/Eisvogel-${eisvogel_version}.tar.gz \
    -O /tmp/eisvogel.tar.gz \
    && tar -xzf /tmp/eisvogel.tar.gz -C /tmp \
    && cp /tmp/Eisvogel-${eisvogel_version}/eisvogel.latex /home/pandocuser/.pandoc/templates/eisvogel.latex \
    && rm -rf /tmp/eisvogel.tar.gz /tmp/Eisvogel-${eisvogel_version}

COPY filters/pandoc-svg.py /home/pandocuser/.pandoc/filters/pandoc-svg.py
COPY default.yaml /home/pandocuser/.pandoc/defaults/default.yaml

USER pandocuser

ENTRYPOINT [ "/usr/local/bin/pandoc", "-d", "default" ]
