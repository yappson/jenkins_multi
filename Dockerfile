FROM openjdk:23-oraclelinux8

EXPOSE 8070

ENV APP_HOME /usr/src/app

COPY target/spring-boot-jpa-h2-0.0.1-SNAPSHOT.jar $APP_HOME/app.jar

WORKDIR $APP_HOME

ENTRYPOINT exec java -jar app.jar
