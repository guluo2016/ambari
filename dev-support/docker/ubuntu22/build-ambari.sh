#!/bin/bash

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

new_version=$1
build_number=$2

build_command="mvn -B clean install jdeb:jdeb -DnewVersion=${new_version} -DbuildNumber=${build_number} -DskipTests -Dpython.ver='python >= 2.6'"

ambari_comile_docker_name='ambari-build-ubuntu22'
if [[ -z $(docker ps -a --format "table {{.Names}}" | grep ${ambari_comile_docker_name}) ]]; then
  docker run -itd --name ${ambari_comile_docker_name} \
    --network host \
    ambari/develop:trunk-ubuntu22
else
  docker start ${ambari_comile_docker_name}
fi

echo "Starting docher named ${ambari_comile_docker_name}"
docker exec ${ambari_comile_docker_name} bash -c "${build_command}"
docker stop ${ambari_comile_docker_name}

# 将编译好的deb包，放到指定目录下，用于生成新的ambari-server安装镜像
