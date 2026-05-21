# Etapa 1: Build con Maven
FROM maven:3.9-eclipse-temurin-17-alpine AS builder

WORKDIR /build

# Copiar archivos POM
COPY pom.xml .

# Descargar dependencias (aprovecha el caché de Docker)
RUN mvn dependency:go-offline -DdownloadSources=false -DdownloadJavadoc=false

# Copiar código fuente
COPY src ./src

# Compilar y generar JAR
RUN mvn clean package -DskipTests

# Etapa 2: Runtime
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Crear usuario no-root para ejecutar la aplicación
RUN addgroup -g 1001 -S springuser && adduser -S springuser -u 1001

# Copiar JAR desde la etapa de build
COPY --from=builder /build/target/*.jar app.jar

# Cambiar propiedad de los archivos
RUN chown -R springuser:springuser /app

# Cambiar al usuario no-root
USER springuser

# Exponer puerto
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:8080/swagger-ui.html || exit 1

# Comando para ejecutar la aplicación
CMD ["java", "-jar", "app.jar", "--spring.profiles.active=docker"]
