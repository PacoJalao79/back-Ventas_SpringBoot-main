
# Backend Ventas — Spring Boot

## Descripción General

Microservicio backend encargado de administrar operaciones relacionadas con ventas.

El sistema expone APIs REST que permiten:
- Registrar ventas.
- Actualizar información.
- Consultar ventas.
- Eliminar registros.
- Persistir datos.

---

# Tecnologías

| Tecnología | Uso |
|---|---|
| Java 21 | Lenguaje |
| Spring Boot | Backend |
| MySQL | Persistencia |
| Docker | Contenedores |
| Maven | Dependencias |
| Swagger | Documentación |

---

# Arquitectura

```text
Controller
   ↓
Service
   ↓
Repository
   ↓
Database
```

---

# Funcionamiento

## Controllers

Reciben solicitudes HTTP.

Ejemplo:

```java
@PostMapping
public Venta guardar(@RequestBody Venta venta)
```

---

## Services

Contienen:
- Validaciones
- Lógica de negocio
- Procesamiento

---

## Repository

Acceden a:
- MySQL
- Tablas
- Consultas

---

# Flujo del Sistema

```text
Frontend
   ↓
Controller
   ↓
Service
   ↓
Repository
   ↓
MySQL
```

---

# Configuración

```properties
server.port=8082

spring.datasource.url=jdbc:mysql://localhost:3306/ventas_db
```

---

# Instalación

## Requisitos

- Java 21
- Maven
- MySQL

---

## Ejecutar Proyecto

```bash
./mvnw spring-boot:run
```

---

# Swagger

```bash
http://localhost:8082/swagger-ui/index.html
```

---

# Dockerización

## Construir Imagen

```bash
docker build -t backend-ventas .
```

---

## Ejecutar Contenedor

```bash
docker run -d -p 8082:8082 backend-ventas
```

---

# Persistencia

Spring Data JPA:
- ORM
- Repositorios
- Consultas automáticas

---

# Integración Frontend

Ejemplo:

```javascript
axios.get("http://localhost:8082/api/ventas")
```

---

# AWS EC2

```text
Frontend
   ↓
Backend Ventas
   ↓
MySQL
```

---

# Buenas Prácticas

- Arquitectura limpia
- APIs REST
- Docker
- Persistencia desacoplada
- Separación por capas