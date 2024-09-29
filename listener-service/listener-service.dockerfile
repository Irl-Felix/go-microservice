FROM alpine:latest

RUN mkdir /app

COPY listenerApp /app
RUN chmod +x /app/listenerApp  # Ensure the service binary is executable

CMD [ "/app/listenerApp"]