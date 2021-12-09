# frozen_string_literal: true

module Rubq
  # Rubq::Fieldset represents a row to be inserted in the database
  #
  # @attr_reader fields [Hash] the fields of the fieldset
  # @attr_reader schema [Rubq::Schema] the schema of the fieldset
  class Fieldset
    attr_reader :fields, :schema

    # @param fields [Hash] the fields
    # @param schema [Rubq::Schema] the schema to validate the fields against
    # @return [Rubq::Fieldset] a Rubq::Fielset object
    def initialize(fields, schema)
      @fields = fields
      @schema = schema
    end

    # Validates the fields against the Schema
    # Work in progress
    # @return [TrueClass] if the fields meet the validation requirements
    # @return [FalseClass] if the fields do not meet the validation requirements
    def validate
      @fields if true
    end

    # Validates the fields against the Schema
    # Work in progress
    # @raise [Rubq::ValidationError] if the fields do not validate against the schema
    # @return [TrueClass] if the fields meet the validation requirements
    # @return [FalseClass] if the fields do not meet the validation requirements
    def validate!
      @fields if true
    end
  end
end
