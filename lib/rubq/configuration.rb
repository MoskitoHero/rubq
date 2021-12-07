# frozen_string_literal: true

module Rubq
  # Manages access to the configuration options
  class Configuration
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
