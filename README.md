# Spring Boot + GraalVM Native Image for Fly.io Free Tier

### 1. Build the Docker Image Locally
Because compiling a native image takes 3-4GB of RAM, you cannot compile it directly on Fly.io's 1GB remote builder. Run this locally (requires Docker running):
```bash
./mvnw spring-boot:build-image
```
This builds a super-optimized GraalVM container called `demo:0.0.1-SNAPSHOT`.

### 2. Deploy to Fly.io
Log in and deploy using your local image:
```bash
fly launch --image demo:0.0.1-SNAPSHOT
```
