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

workdir=$(cd $(dirname $0); pwd)
AMBARI_PROJECT_ROOT=$workdir/../../../
AMBARI_VERSION=`awk -F '[<>]' '/<revision>/ {print $3; exit}' ${AMBARI_PROJECT_ROOT}/pom.xml`

echo "Building ambari on rocky8"
sh ${workdir}/build_ambari_rocky8.sh ${AMBARI_PROJECT_ROOT} ${AMBARI_VERSION}
echo "Building ambari server on rocky8 successfully"

echo "Building ambari image on rocky8"
cd ${workdir}
ambari_server_rpm_path=${AMBARI_PROJECT_ROOT}/ambari-server/target/rpm/ambari-server/RPMS/x86_64/ambari-server-${AMBARI_VERSION}.x86_64.rpm
cp ${ambari_server_rpm_path} ambari-server-${AMBARI_VERSION}.x86_64.rpm
docker build -t ambari:${AMBARI_VERSION}-rocky-8 ${workdir}/ --build-arg AMABARI_SERVER_RPM=ambari-server-${AMBARI_VERSION}.x86_64.rpm
rm -f ambari-server-${AMBARI_VERSION}.x86_64.rpm
echo "Building ambari image on rocky8 successfully"