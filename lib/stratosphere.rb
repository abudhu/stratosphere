require "stratosphere/version"
require "stratosphere/resources"
require "stratosphere/template"
require "stratosphere/parameters"
require "stratosphere/mappings"
require "stratosphere/conditions"

require 'yaml'

module Stratosphere
  class Aws
    def initialize
      @template = Stratosphere::Template.new
      #TODO: Move Params.new here as @params = so everythign can use it.
    end
    def add_parameter(&block)
      params = Stratosphere::Parameters.new
      @template.embed_parameters(params.add_parameter(&block))
    end
    def add_parameter_group(&block)
      @template.embed_metadata("  AWS::CloudFormation::Interface:\n")
      params = Stratosphere::Parameters.new
      @template.embed_metadata(params.add_parameter_group(&block))
    end

    def add_parameter_labels(&block)
      params = Stratosphere::Parameters.new
      @template.embed_metadata(params.add_parameter_labels(&block))
    end

    def add_conditions(&block)
      condition = Stratosphere::Conditions.new
      @template.embed_conditions(condition.add_condition(&block))
    end

    def add_mappings(&block)
      mapping = Stratosphere::Mappings.new
      @template.emebed_mappings(mapping.add_mapping(&block))
    end

    def add_resources(&block)
      resources = Stratosphere::Resources.new
      @template.embed_resources(resources.add_resource(&block))
    end

    def display_template
      @template.display_template
    end
    def to_yaml
      @template.to_yaml
    end
    #@template.display_template

  end
end
