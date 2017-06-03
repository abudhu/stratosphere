module Amit
  class Vpc
    def initialize(&block)
      @resource = ""
      instance_eval &block
    end
    def cidr_block(value)
      @resource << "    CidrBlock: #{value}"
    end
    def type(type)

    end
  end
end
