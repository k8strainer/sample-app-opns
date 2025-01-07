package main

import (
        "fmt"
        "log"
        "net/http"
        "time"

        "github.com/prometheus/client_golang/prometheus"
        "github.com/prometheus/client_golang/prometheus/promhttp"
)

// Metrics
var (
        // Lediglich das Label "status" ergänzt
        sampleAppRequestsTotal = prometheus.NewCounterVec(
                prometheus.CounterOpts{
                        Name: "sample_app_http_requests_total",
                        Help: "Total number of HTTP requests received by the Sample App.",
                },
                []string{"method", "endpoint", "status"},
        )
        sampleAppRequestDuration = prometheus.NewHistogramVec(
                prometheus.HistogramOpts{
                        Name:    "sample_app_http_request_duration_seconds",
                        Help:    "Duration of HTTP requests to the Sample App in seconds.",
                        Buckets: prometheus.DefBuckets,
                },
                []string{"method", "endpoint", "status"},
        )
)

func init() {
        // Register metrics
        prometheus.MustRegister(sampleAppRequestsTotal)
        prometheus.MustRegister(sampleAppRequestDuration)
        // Initialize default labels to avoid missing metrics
        initializeMetrics()
}

func initializeMetrics() {
        // "status"=200 als Default
        sampleAppRequestsTotal.WithLabelValues("GET", "/", "200").Add(0)
        sampleAppRequestDuration.WithLabelValues("GET", "/", "200").Observe(0.0)
}

func main() {
        //version := "1.0.0"
        version := "2.0.0"

        // Serve application on 8080
        go func() {
                http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
                        start := time.Now()

                        // Statuscode 200 explizit setzen
                        w.WriteHeader(http.StatusOK)

                        fmt.Fprintf(w, "<html><body><h1>Sample App</h1><p>New Version: %s</p></body></html>", version)
                        duration := time.Since(start).Seconds()

                        // Record metrics mit status="200"
                        sampleAppRequestsTotal.WithLabelValues(r.Method, "/", "200").Inc()
                        sampleAppRequestDuration.WithLabelValues(r.Method, "/", "200").Observe(duration)
                })

                log.Println("Starting application server on :8080")
                log.Fatal(http.ListenAndServe(":8080", nil))
        }()

        // Serve metrics on 9090
        http.Handle("/metrics", promhttp.Handler())
        log.Println("Starting metrics server on :9090")
        log.Fatal(http.ListenAndServe(":9090", nil))
}

