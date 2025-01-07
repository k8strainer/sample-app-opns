FROM golang:1.22 AS builder

WORKDIR /app

# Go-Module initialisieren und Abhängigkeiten herunterladen
COPY go.mod go.sum ./
RUN go mod download

# Quellcode kopieren und bauen
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -o app .

FROM alpine:latest

# Für statische Builds sicherstellen, dass wichtige Bibliotheken installiert sind
RUN apk --no-cache add ca-certificates

WORKDIR /app

# Binärdatei aus dem Build-Container kopieren
COPY --from=builder /app/app /app/app

# Sicherstellen, dass die Datei ausführbar ist
RUN chmod +x /app/app

EXPOSE 8080
EXPOSE 9090

ENTRYPOINT ["/app/app"]

