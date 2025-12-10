FROM ghcr.io/graalvm/jdk-community:25

ARG VERSION=1.10.155
ARG EDITION=standalone-agent

WORKDIR /spark
ADD --checksum=sha256:7fb0ac0bb49577d44cbb25e493a6ccc0b9ef0a65e6388dd9d61f9f7a0d7ebbee \
    https://ci.lucko.me/job/spark/505/artifact/spark-${EDITION}/build/libs/spark-${VERSION}-${EDITION}.jar spark-agent.jar

ENV PORT=2222
COPY config.json config.json

ENTRYPOINT ["java", "-jar", "spark-agent.jar", "<pid>", "port=${PORT}"]
