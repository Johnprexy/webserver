FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt install -y apache2 tzdata && apt clean

COPY webserver.sh /usr/local/bin/webserver.sh

RUN chmod +x /usr/local/bin/webserver.sh

RUN /usr/local/bin/webserver.sh

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
