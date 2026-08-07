FROM eclipse-temurin:21-jre

WORKDIR /app

COPY target/*.jar /app/

RUN useradd -r -u 10001 appuser && \
    groupadd -r appgroup && \
    usermod -aG appgroup appuser

RUN chown -R appuser:appgroup /app

USER appuser

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]