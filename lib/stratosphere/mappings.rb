module Stratosphere
  class Mappings
    def initialize
      @mappings = ""
    end

    def add_mapping(&block)
      instance_eval &block if block_given?
    end

    def mapping(name, &block)
      @mappings << "  #{name}:\n"
      instance_eval &block if block_given?
    end

    def parent(name, &block)
      @mappings << "    #{name}:\n"
      instance_eval &block if block_given?
    end

    def child(key, value)
      @mappings << "      #{key}: #{value}\n"
    end

  end
end
