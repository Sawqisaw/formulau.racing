FROM golang:1.14 AS go_build
MAINTAINER FormulaU Racing

# Build and install Wellington
RUN go get github.com/wellington/wellington/wt

# Build and install Hugo
WORKDIR /go_builds
RUN git clone https://github.com/gohugoio/hugo.git ./hugo
WORKDIR /go_builds/hugo
RUN go install --tags extended

# Build and install minify
from node:10

RUN npm i minify -g

WORKDIR /srv/build-site

# Grab wt, hugo, and the gen script.
COPY ./scripts/gen-site.sh .
RUN chmod +x ./gen-site.sh
# Wellington
COPY --from=0 /go/bin/wt .
# Hugo
COPY --from=0 /go/bin/hugo .

WORKDIR /srv/build-site/site-content
CMD ../gen-site.sh
