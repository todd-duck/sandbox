# Base Image Jan 2024
FROM openjdk:17-jdk

COPY target/spring-petclinic-3.2.0-SNAPSHOT.jar /opt/spring-petclinic.jar

EXPOSE 8080
CMD ["java", "-jar", "/opt/spring-petclinic.jar"]
