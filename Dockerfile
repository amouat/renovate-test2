FROM cgr.dev/chainguard/go:latest-dev@sha256:ff187ecd4bb5b45b65d680550eed302545e69ec4ed45f276f385e1b4ff0c6231 as builder

WORKDIR /work

COPY go.mod /work/
COPY cmd /work/cmd
COPY internal /work/internal

# See https://mt165.co.uk/blog/static-link-go/ for creating static binaries
RUN CGO_ENABLED=0 go build -o hello ./cmd/server

FROM cgr.dev/chainguard/static:latest@sha256:791657dd88dea8c1f9d3779815429f9c681a9a2778fc66dac3fbf550e1f1d9c8
COPY --from=builder /work/hello /hello 

ENTRYPOINT ["/hello"]

