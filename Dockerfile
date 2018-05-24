FROM anapsix/alpine-java:8

ADD build/libs/dropwizard-gradle-standalone.jar /hello.jar
ADD src/dist/config/helloworld.yml /hello.yml

CMD ["java", "-jar", "/hello.jar", "server", "/hello.yml"]


