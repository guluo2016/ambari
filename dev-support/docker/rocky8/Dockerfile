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

ARG AMBARI_SERVER_RPM

COPY ${AMBARI_SERVER_RPM} /opt/
RUN curl -L -s -S https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.14%2B7/OpenJDK17U-jdk_x64_linux_hotspot_17.0.14_7.tar.gz  -o OpenJDK17U-jdk_x64_linux_hotspot_17.0.14_7.tar.gz && \
    curl -L -s -S https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u442-b06/OpenJDK8U-jdk_x64_linux_hotspot_8u442b06.tar.gz -o OpenJDK8U-jdk_x64_linux_hotspot_8u442b06.tar.gz && \
    tar -xzf OpenJDK17U-jdk_x64_linux_hotspot_17.0.14_7.tar.gz -C /usr/local && \
    tar -xzf OpenJDK8U-jdk_x64_linux_hotspot_8u442b06.tar.gz -C /usr/local && \
    ln -s /usr/local/jdk8u442-b06 /usr/local/java && \
    rm -f OpenJDK17U-jdk_x64_linux_hotspot_17.0.14_7.tar.gz OpenJDK8U-jdk_x64_linux_hotspot_8u442b06.tar.gz && \
    dnf install -y rpm-build python36 && \
    dnf install -y /opt/${AMBARI_SERVER_RPM} && \
    rm -f /opt/${AMBARI_SERVER_RPM}

ENV JAVA_HOME=/usr/local/java
ENV PATH=$JAVA_HOME/bin:$PATH