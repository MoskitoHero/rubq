# frozen_string_literal: true

module Rubq
  # Wrapper around the Bigquery connection
  class Adapter
    attr_reader :dataset, :table

    def initialize(options)
      @bigquery = Google::Cloud::Bigquery.new

      @dataset = @bigquery.dataset(options[:dataset] || 'default')
      @table = @dataset.table(options[:table])
    end
  end
end
