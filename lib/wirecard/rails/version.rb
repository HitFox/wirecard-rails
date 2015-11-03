require_relative 'gem_version'

module Wirecard
  module Rails
    def self.version
      gem_version
    end
  end
end

