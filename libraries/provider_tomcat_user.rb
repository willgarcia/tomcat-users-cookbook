class Chef
  class Provider
    class TomcatUser < Chef::Provider::LWRPBase

    include Chef::Mixin::ShellOut

    def load_current_resource
      Gem.clear_paths
      @current_resource = Chef::Resource::TomcatUser.new(@new_resource.name)
      @current_resource
    end

      action :create do
        create_user
      end

      private

      def create_user
        template new_resource.config do
          source 'tomcat-users.xml.erb'
          owner 'root'
          group 'root'
          mode '0644'
          variables(
            :roles => new_resource.roles,
          )
          notifies :restart, "service[#{node['tomcat']['service_name']}]"
        end
      end



    end
  end
end