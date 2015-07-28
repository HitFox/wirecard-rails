module Generators
  module Wirecard
    class InstallGenerator < Rails::Generators::Base

      def run_other_generators
        generate "wirecard:config"
      end
    end
  end
end