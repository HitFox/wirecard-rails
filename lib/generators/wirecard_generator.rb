module Generators
  class WirecardGenerator < Rails::Generators::Base

    def run_other_generators
      generate "wirecard:config" # or whatever you want here
    end
  end
end