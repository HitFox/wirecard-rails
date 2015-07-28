module Wirecard
  module Generators
    class ConfigGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
    
      def copy_initializer_file
        copy_file "initializer.rb", "config/initializers/wirecard.rb"
      end
    end
  end
end