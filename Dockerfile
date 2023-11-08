FROM maven:3.8.3-openjdk-17
COPY / /home
WORKDIR /home
RUN mvn clean package
EXPOSE 8080
CMD ["java","-jar","/home/target/secretsanta-0.0.1-SNAPSHOT.jar"]
