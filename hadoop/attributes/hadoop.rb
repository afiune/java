#
# Cookbook Name:: hadoop
# Attributes:: hadoop
#
# Copyright 2009, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

hadoop Mash.new unless attribute?("hadoop")
hadoop[:mirror_url] = "http://apache.osuosl.org/hadoop/core" unless hadoop.has_key?(:mirror_url)
hadoop[:version] = "0.19.1" unless hadoop.has_key?(:version)
hadoop[:uid] = 991          unless hadoop.has_key?(:uid)
hadoop[:gid] = 65534        unless hadoop.has_key?(:gid)

case platform
when "redhat","centos","fedora"
  hadoop[:java_home] = "/usr/lib/jvm/jre-#{languages[:java][:version].gsub(/_0/, '-openjdk') if languages.has_key?(:java)}" unless hadoop.has_key?(:java_home)
when "debian","ubuntu"
  hadoop[:java_home] = "/usr/lib/jvm/java-6-sun-#{languages[:java][:version].gsub(/_/, '.') if languages.has_key?(:java)}" unless hadoop.has_key?(:java_home)
end
