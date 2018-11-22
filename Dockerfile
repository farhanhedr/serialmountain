FROM openjdk:8-jdk-alpine
RUN ["mkdir", "/app"]

#VOLUME /app
WORKDIR /app

RUN ["ls", "-lah"]
RUN ["pwd"]
RUN ["ls", "-lah", "/app"]

ARG DEPENDENCY=target/dependency

#./mvnw package && java -jar target/serialmountain-v0.0.2.jar

COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INFß
COPY ${DEPENDENCY}/BOOT-INF/classes /app

#COPY ./target/dependency/BOOT-INF/lib /app/lib
#COPY ./target/dependency/META-INF /app/META-INF
#COPY ./target/dependency/BOOT-INF/classes /app

ENTRYPOINT ["java","-cp","app:app/lib/*","com.technifai.serialmountain.SerialmountainApplication"]