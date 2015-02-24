#
# Cookbook Name:: tomcat-users
# Recipe:: users
#

template "#{node["tomcat"]["config_dir"]}/tomcat-users.xml" do
  source 'tomcat-users.xml.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    :users => TomcatCookbook.users,
    :roles => TomcatCookbook.roles,
  )
  notifies :restart, "service[#{node['tomcat']['service_name']}]"
end
