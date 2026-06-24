# ============================================================
# STAGE 1: Build con Maven
# ============================================================
FROM maven:3.9.6-eclipse-temurin-17-alpine AS builder

WORKDIR /app

# Copiar solo el pom.xml primero (optimiza caché de capas)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copiar código fuente y compilar
COPY src ./src
RUN mvn clean package -DskipTests -B

# ============================================================
# STAGE 2: Runtime mínimo
# ============================================================
FROM eclipse-temurin:17-jre-alpine

# Usuario no root (buena práctica de seguridad)
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

# Copiar el JAR desde el stage anterior
COPY --from=builder /app/target/*.jar app.jar

# Cambiar al usuario no root
USER appuser

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]