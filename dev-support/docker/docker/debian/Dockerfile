#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

FROM ubuntu:22.04

RUN curl https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_linux-x64_bin.tar.gz -o /root/openjdk-17.0.2_linux-x64_bin.tar.gz && \
  curl https://archive.apache.org/dist/maven/maven-3/3.9.0/binaries/apache-maven-3.9.0-bin.tar.gz -o /root/apache-maven-3.9.0-bin.tar.gz && \
  tar -zxf /root/openjdk-17.0.2_linux-x64_bin.tar.gz -C /usr/local/ && \
  tar -zxf /root/apache-maven-3.9.0-bin.tar.gz -C /usr/local && \
  rm -rf /root/openjdk-17.0.2_linux-x64_bin.tar.gz /opt/apache-maven-3.9.0-bin.tar.gz && \
  apt install git python3 -y && \
  mkdir /build && \
  git clone -b --depth 1 trunk https://github.com/apache/ambari.git
ENV JAVA_HOME /usr/local/jdk-17.0.2
ENV PATH $PATH:$JAVA_HOME/bin
ENV MAVEN_HOME /usr/local/apache-maven-3.9.0/
ENV PATH $PATH:$MAVEN_HOME/bin

WORKDIR /build/ambari
