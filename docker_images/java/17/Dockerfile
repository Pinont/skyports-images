FROM azul/zulu-openjdk:17

RUN apt-get update && apt-get install -y curl wget iproute2 && rm -rf /var/lib/apt/lists/*

WORKDIR /app/data

COPY ./entrypoint.sh /entrypoint.sh
CMD [ "/bin/bash", "/entrypoint.sh" ]