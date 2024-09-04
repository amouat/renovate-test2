FROM cgr.dev/chainguard.edu/python:3.11-dev

WORKDIR /work

COPY go.mod /work/
COPY cmd /work/cmd
COPY internal /work/internal

FROM cgr.dev/chainguard.edu/python:3.11

ENTRYPOINT ["/hello"]

