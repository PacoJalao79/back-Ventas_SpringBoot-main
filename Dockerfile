# ============================================================
# STAGE 1: Build con Maven
# ============================================================
FROM maven:3.9.6-eclipse-temurin-17-alpine AS builder

WORKDIR /app

COPY Springboot-API-REST/pom.xml .
RUN mvn dependency:go-offline -B

COPY Springboot-API-REST/src ./src
RUN mvn clean package -DskipTests -B

# ============================================================
# STAGE 2: Runtime
# ============================================================
FROM eclipse-temurin:17-jre-alpine

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar

USER appuser

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
