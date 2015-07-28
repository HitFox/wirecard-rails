module Wirecard
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      
      def copy_initializer_file
        copy_file "wirecard.rb", "config/initializers/wirecard.rb"
      end
    end
  end
end