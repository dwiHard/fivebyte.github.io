## Download binary dengan retry

```java
    public static byte[] downloadBinaryBytesOkhttp(String url, int maxRetries, long baseDelayMillis)
            throws IOException {
        // Configure OkHttpClient with timeouts
        OkHttpClient client = new OkHttpClient.Builder()
                .connectTimeout(Duration.ofSeconds(10))
                .readTimeout(Duration.ofSeconds(30))
                .writeTimeout(Duration.ofSeconds(10))
                .build();

        // Retry loop
        for (int attempt = 0; attempt <= maxRetries; attempt++) {
            try {
                // Create a request to the specified URL
                Request request = new Request.Builder()
                        .url(url)
                        .build();

                // Execute the request
                try (Response response = client.newCall(request).execute()) {
                    // Check if the response was successful
                    if (response.isSuccessful() && response.body() != null) {
                        return response.body().bytes();
                    }
                    if (!response.isSuccessful()) {
                        throw new IOException("Unexpected response code: " + response);
                    }
                }

            } catch (IOException e) {
                // If it's the last attempt, rethrow the exception
                if (attempt == maxRetries) {
                    throw e;
                }

                // Calculate exponential backoff delay
                long delay = calculateBackoffDelay(attempt, baseDelayMillis);

                // Log or handle the retry
                System.out.println("Download attempt " + (attempt + 1) + " failed. Retrying in " + delay + "ms");

                // Wait before next retry
                try {
                    Thread.sleep(delay);
                } catch (InterruptedException interruptedException) {
                    Thread.currentThread().interrupt();
                    throw new IOException("Download interrupted", e);
                }
            }
        }

        // This line should never be reached due to exception handling
        throw new IOException("Failed to download after " + (maxRetries + 1) + " attempts");
    }
```
