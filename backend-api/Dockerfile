# Stage 1: Build the application using Maven inside Docker (Upgraded to Java 25)
FROM maven:3.9.6-eclipse-temurin-25 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Create the clean runtime environment (Upgraded to Java 25)
FROM eclipse-temurin:25-jre-jammy
WORKDIR /app
# This line safely pulls the jar out of the build stage above
COPY --from=build /app/target/*.jar app.jar 
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]