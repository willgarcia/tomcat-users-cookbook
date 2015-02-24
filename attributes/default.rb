#
# Cookbook Name:: tomcat-users
# Attributes:: default
#

default['tomcat']['base_version'] = 7
default['tomcat']['service_name'] =  "tomcat#{node["tomcat"]["base_version"]}"

case node['platform']

when 'centos', 'redhat', 'fedora', 'amazon', 'scientific', 'oracle'
  default['tomcat']['config_dir'] = "/etc/tomcat#{node["tomcat"]["base_version"]}"
when 'debian', 'ubuntu'
  default['tomcat']['config_dir'] = "/etc/tomcat#{node["tomcat"]["base_version"]}"
when 'smartos'
  default['tomcat']['config_dir'] = '/opt/local/share/tomcat/conf'
else
  default['tomcat']['config_dir'] = "/etc/tomcat#{node["tomcat"]["base_version"]}"
end
