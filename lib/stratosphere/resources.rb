require "stratosphere/lookup"

module Stratosphere
  class Resources
    def initialize()
      @lookup = Stratosphere::Lookup.new
      @resource = ""
    end

    def add_resource(&block)
      instance_eval &block if block_given?
    end

    def resource(name, &block)
      @resource << "  #{name}:\n    Type: #{@lookup.find(name)}\n"
    end

    def properties(&block)
      @resource << "    Properties:\n"
    end

    
  end
end
