# frozen_string_literal: true

module Rubq
  # Rubq::Adapter is a wrapper around the Bigquery library
  class Adapter
    extend Forwardable

    def_delegators :configuration, *Configuration.configurable_attributes
    def_delegators :dataset, :table, :tables, :create_table

    # @param [Hash] attrs
    # @return [Rubq::Adapter]
    def initialize(attrs = {})
      self.configuration.attributes = attrs
    end

    # @return [nil]
    def configure
      yield configuration if block_given?
    end

    # @return [Rubq::Configuration]
    def configuration
      @configuration ||= Configuration.new
    end

    private

    # @return [Google::Cloud::Bigquery]
    def bigquery
      @bigquery ||= Google::Cloud::Bigquery.new(project: configuration.project)
    end

    # @return [Symbol]
    def dataset
      @dataset ||= bigquery.dataset(configuration.dataset)
    end
  end
end
