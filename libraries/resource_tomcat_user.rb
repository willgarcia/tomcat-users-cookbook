class Chef
  class Resource
    class TomcatUser < Chef::Resource

      def initialize(name, run_context = nil)
        super
        @resource_name = :tomcat_user
        @config = nil
        @roles = []

        @allowed_actions.push(:create)
        @action = :create
      end

      def roles(arg = nil)
        set_or_return(
          :roles,
          arg,
          kind_of: Array
        )
      end

      def config(arg = nil)
        set_or_return(
          :config,
          arg,
          kind_of: String
        )
      end

    end
  end
end