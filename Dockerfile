FROM java:8

# install maven
RUN apt-get update
RUN apt-get install -y maven

# Set the working directory
WORKDIR /appcode

# Download dependencies
ADD pom.xml /appcode/pom.xml
RUN ["mvn", "dependency:resolve"]
RUN ["mvn", "verify"]

# Compile and build jar
ADD src /appcode/src
RUN ["mvn", "package"]

EXPOSE 8080
CMD ["/usr/lib/jvm/java-8-openjdk-amd64/bin/java", "-jar", "target/SpringTest-1.0-SNAPSHOT.jar"]