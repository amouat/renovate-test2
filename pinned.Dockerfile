FROM cgr.dev/chainguard.edu/python:3.12-dev

WORKDIR /work

COPY go.mod /work/
COPY cmd /work/cmd
COPY internal /work/internal

FROM cgr.dev/chainguard.edu/python:3.12

ENTRYPOINT ["/hello"]

