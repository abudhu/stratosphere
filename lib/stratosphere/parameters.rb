module Stratosphere
  class Parameters
    def initialize()
      @parameters = ""
      @parameters_group = ""
    end

    def add_parameter(&block)
      instance_eval &block if block_given?
    end

    def add_parameter_group(&block)
      @parameters_group << "    ParameterGroups:\n"
      instance_eval &block if block_given?
    end

    def add_parameter_labels(&block)
      @parameters_group << "    ParameterLabels:\n"
      instance_eval &block if block_given?
    end

    def group(name, &block)

      @parameters_group << "      - Label:\n"
      @parameters_group << "          default: #{name}\n"
      @parameters_group << "        Parameters:\n"
      instance_eval &block if block_given?
    end

    def parameter(param)
      @parameters_group << "          - #{param}\n"
    end

    def label(old_name, action=:rename, new_name)
      @parameters_group << "      #{old_name}:\n"
      @parameters_group << "        default: \"#{new_name}\"\n"
    end

    def name(name, append_type=:none, affix="")
      case append_type
      when :prepend
        @parameters << "  #{affix}#{name}:\n"
      when :append
        @parameters << "  #{name}#{affix}:\n"
      else
        @parameters << "  #{name}:\n"
      end
    end

    def type(type)
      @parameters << "    Type: #{type}\n"
    end

    def default(default_value)
      @parameters << "    Default: #{default_value}\n"
    end

    def allowed_values(*allowed_values)
      @parameters << "    AllowedValues:\n"
        allowed_values.each do | value |
          @parameters << "      - #{value}\n"
        end
      return @parameters
    end

    def allowed_pattern(pattern)
      @parameters << "    AllowedPatern: #{pattern}\n"
    end

    def description(desc)
      @parameters << "    Description: #{desc}\n"
    end

    def password(pass)

      if pass == true || pass == false
      else
        raise "Password must be set to either true or false."
      end
      @parameters << "    NoEcho: #{pass}\n"
    end
  end
end
