FROM maven:3-jdk-8-alpine as builder
ADD . /root
WORKDIR /root
RUN mvn package
FROM openjdk:8-jre-alpine
WORKDIR /root
COPY --from=builder /root/target/simple-crud-app-0.0.1-SNAPSHOT.jar .
ENTRYPOINT [ "sh", "-c", "java -jar simple-crud-app-0.0.1-SNAPSHOT.jar" ]
EXPOSE 8080
