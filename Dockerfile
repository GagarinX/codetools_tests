FROM 641016094908.dkr.ecr.us-east-1.amazonaws.com/gagarinx/golang:1.23 as builder

WORKDIR /workspace

COPY * /workspace

RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GO111MODULE=on go build -a -o bottles main.go

FROM gcr.io/distroless/static:nonroot
WORKDIR /

COPY --from=builder /workspace/bottles .

ENTRYPOINT ["/bottles"]
