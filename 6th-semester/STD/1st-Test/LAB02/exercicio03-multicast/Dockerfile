# Imagem enxuta apenas com a JRE 25 (o build acontece no host, via ./gradlew installDist)
FROM eclipse-temurin:25-jre

WORKDIR /app

# Distribuição gerada por `./gradlew installDist`
COPY app/build/install/app/lib /app/lib

# A classe principal (servidor ou cliente) é escolhida no docker-compose.yml
ENTRYPOINT ["java", "-cp", "/app/lib/*"]
