package main

import (
    "fmt"
    "log"
    "net/http"
    "time"
)

func main() {
    // Đây chỉ là một service placeholder đơn giản
    fmt.Println("Starting UserService...")

    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "Hello from UserService at %s", time.Now())
    })

    log.Fatal(http.ListenAndServe(":8081", nil))
}
