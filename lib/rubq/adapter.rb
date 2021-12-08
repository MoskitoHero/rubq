# frozen_string_literal: true

module Rubq
  # Rubq::Adapter is a wrapper around the `Google::Cloud::Bigquery` library
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

    # @return [Google::Cloud::Bigquery]
    def connection
      @connection ||= Google::Cloud::Bigquery.new(project: configuration.project)
    end

    # @return [Google::Cloud::Bigquery::Dataset, NilClass]
    def dataset
      @dataset ||= connection.dataset(configuration.dataset)
    end
  end
end
