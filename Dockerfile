# === Stage 1: Build the application using Maven ===
FROM maven:3.9.6-eclipse-temurin-21-alpine AS build
WORKDIR /app

# Copy pom.xml and source code
COPY pom.xml .
COPY src ./src

# Compile and package the application jar, skipping tests to speed it up
RUN mvn clean package -DskipTests

# === Stage 2: Run the application ===
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Copy the compiled jar from the build stage instead of your local machine
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar app.jar

# Run the app with strict memory boundaries to fit Render's 512MB limit
ENTRYPOINT ["java", "-Xmx380m", "-Xss256k", "-jar", "app.jar"]
