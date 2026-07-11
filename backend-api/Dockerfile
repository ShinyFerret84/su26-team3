# Stage 1: Build the application using Maven
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Create the lightweight runtime image
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app
# Copies the jar built in Stage 1 directly
COPY --from=build /app/target/*.jar app.jar 
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]