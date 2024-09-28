FROM alpine:latest

RUN mkdir /app

COPY loggerAPP /app
RUN chmod +x /app/loggerAPP  # Ensure the service binary is executable

CMD [ "/app/loggerAPP"]