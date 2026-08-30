# Step 1: Use an official lightweight OpenJDK runtime base image
FROM eclipse-temurin:21-jre-alpine

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the compiled jar from your local machine into the container
COPY target/demo-0.0.1-SNAPSHOT.jar app.jar

# Step 4: Run the app with strict memory boundaries to fit Render's 512MB limit
ENTRYPOINT ["java", "-Xmx380m", "-Xss256k", "-jar", "app.jar"]
