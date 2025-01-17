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

RUN curl https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_linux-x64_bin.tar.gz -o /root/openjdk-17.0.2_linux-x64_bin.tar.gz && \
  tar -zxf /root/openjdk-17.0.2_linux-x64_bin.tar.gz -C /usr/local/ && \
  rm -rf /root/openjdk-17.0.2_linux-x64_bin.tar.gz && \
  yum install git rpm-build -y
ENV JAVA_HOME /usr/local/jdk-17.0.2
ENV PATH $PATH:$JAVA_HOME/bin

# 安装ambar-server

# setup
