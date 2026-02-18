# ========================
# STAGE 1 - BUILD
# ========================
FROM maven:3.9-eclipse-temurin-17 AS builder

WORKDIR /app

# Copia o pom.xml primeiro (aproveita cache do Docker)
COPY app/pom.xml .
RUN mvn dependency:go-offline -B

# Copia o código fonte e builda
COPY app/src ./src
RUN mvn clean package -DskipTests -B

# ========================
# STAGE 2 - RUN
# ========================
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Cria usuário não-root (boa prática de segurança)
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Copia apenas o JAR gerado
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
