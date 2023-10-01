FROM golang:alpine3.18 AS builder

WORKDIR /app

COPY go.mod hello-fullcycle.go ./

RUN go build -o /fullcycle-rocks

FROM scratch

WORKDIR /app

COPY --from=builder /fullcycle-rocks /fullcycle-rocks

ENTRYPOINT [ "/fullcycle-rocks" ]