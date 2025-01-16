FROM rockylinux:8

# jdk
RUN curl https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_linux-x64_bin.tar.gz -o /root/openjdk-17.0.2_linux-x64_bin.tar.gz
RUN tar -xvzf /root/openjdk-17.0.2_linux-x64_bin.tar.gz -C /usr/local/
RUN rm -rf /root/openjdk-17.0.2_linux-x64_bin.tar.gz
ENV JAVA_HOME /usr/local/jdk-17.0.2
ENV PATH $PATH:$JAVA_HOME/bin

# maven
RUN curl https://archive.apache.org/dist/maven/maven-3/3.9.0/binaries/apache-maven-3.9.0-bin.tar.gz -o /root/apache-maven-3.9.0-bin.tar.gz
RUN tar -zxf /root/apache-maven-3.9.0-bin.tar.gz -C /usr/local/
RUN rm -rf /root/apache-maven-3.9.0-bin.tar.gz
ENV MAVEN_HOME 
ENV 





