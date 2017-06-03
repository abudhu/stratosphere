module Stratosphere
  class Conditions
    def initialize
      @conditions = ""
    end

    def add_condition(&block)
      instance_eval &block if block_given?

    end

    def condition(name, &block)
      @conditions << "  #{name}: "
      instance_eval &block if block_given?
    end

    def function(func, value1, value2)
      puts value1.class
      #case func
      #when "equals"
      #  @conditions << "!Equals [#{value1},#{value2}]"
      #end
      @conditions <<  func
    end
  end
end
