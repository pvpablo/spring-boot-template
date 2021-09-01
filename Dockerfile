FROM maven:3-jdk-11 AS BUILD
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package

FROM openjdk:11-jre-slim
COPY --from=build /usr/src/app/target/spring-boot-template-0.0.1-SNAPSHOT.jar /usr/app/spring-boot-template-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/app/spring-boot-template-0.0.1-SNAPSHOT.jar"]
