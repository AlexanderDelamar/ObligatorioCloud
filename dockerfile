FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y git curl

CMD git config --global http.sslVerify false \
    && git clone https://github.com/ORT-FI-7417-SolucionesCloud/obligatorio-online-boutique.git /app

WORKDIR /app
EXPOSE 80
ENTRYPOINT ["bash", "-c", "/usr/sbin/apache2ctl -D FOREGROUND"]