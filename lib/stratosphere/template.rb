module Stratosphere
  class Template
    def initialize()
      @header = "---\nAWSTemplateFormatVersion: \"2010-09-09\"\n"
      @parameters = "Parameters:\n"
      @metadata = "Metadata:\n"
      @mappings = "Mappings:\n"
      @conditions = "Conditions:\n"
      @resources = "Resources:\n"
      @outputs = "Outputs:\n"

    end

    def embed_parameters(parameter)
      @parameters << parameter
    end

    def embed_metadata(parameter_group)
      @metadata << parameter_group
    end

    def emebed_mappings(mapping)
      @mappings << mapping
    end

    def embed_conditions(condition)
      @conditions << condition
    end

    def embed_resources(resource)
      @resources << resource
    end

    def display_template
      puts @header
      if @parameters.length > 12 then puts @parameters end
      if @metadata.length > 10 then puts @metadata end
      if @mappings.length > 10 then puts @mappings end
      if @conditions.length > 12 then puts @conditions end
      if @resources.length > 11 then puts @resources end
      if @outputs.length > 9 then puts @outputs end
    end

    def to_yaml
      File.open("/Users/amitb/Dropbox/github/stratosphere/cloudtest.yml", "w") do |file|
        file.write(@header)
        if @parameters.length > 12 then file.write(@parameters) end
        if @metadata.length > 10 then file.write(@metadata) end
        if @mappings.length > 10 then file.write(@mappings) end
        if @conditions > 12 then file.write(@conditions) end
        if @resources > 11 then file.write(@resources) end
        if @outputs > 9 then file.write(@outputs) end
      end
    end
  end
end
