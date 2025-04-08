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
FROM rockylinux:8

# install openjdk17, maven, rpm-build, python3
RUN curl -L -s -S https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.14%2B7/OpenJDK17U-jdk_x64_linux_hotspot_17.0.14_7.tar.gz  -o OpenJDK17U-jdk_x64_linux_hotspot_17.0.14_7.tar.gz && \
    curl -L -s -S  https://archive.apache.org/dist/maven/maven-3/3.9.8/binaries/apache-maven-3.9.8-bin.tar.gz  -o apache-maven-3.9.8-bin.tar.gz && \
    tar -xzf OpenJDK17U-jdk_x64_linux_hotspot_17.0.14_7.tar.gz -C /usr/local && \
    tar -xzf apache-maven-3.9.8-bin.tar.gz -C /usr/local && \
    ln -s /usr/local/jdk-17.0.14+7 /usr/local/java && \
    ln -s /usr/local/apache-maven-3.9.8 /usr/local/maven && \
    rm -f OpenJDK17U-jdk_x64_linux_hotspot_17.0.14_7.tar.gz apache-maven-3.9.8-bin.tar.gz && \
    dnf install -y rpm-build python36

ENV JAVA_HOME=/usr/local/java
ENV MAVEN_HOME=/usr/local/maven
ENV PATH=$JAVA_HOME/bin:$MAVEN_HOME/bin:$PATH