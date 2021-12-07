# frozen_string_literal: true

module Rubq
  # Manages access to the configuration options
  #
  # @attr project [String] a GCP project
  # @attr dataset [String] a Bigquery dataset
  # @attr region [String] a Bigquery region
  class Configuration
    # List of configurable attributes
    CONFIGURABLE_ATTRIBUTES = %i[project dataset region]

    attr_accessor(*CONFIGURABLE_ATTRIBUTES)

    # @return [Array<Symbol>]
    def self.configurable_attributes
      CONFIGURABLE_ATTRIBUTES
    end

    # @param [Hash] attrs
    # @return [Rubq::Configuration]
    def initialize(attrs = {})
      self.attributes = attrs
    end

    # @param [Hash] attrs
    # @return [nil]
    def attributes=(attrs = {})
      attrs.each { |key, value| instance_variable_set("@#{key}", value) }
    end
  end
end
