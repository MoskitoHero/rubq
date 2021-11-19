# frozen_string_literal: true

module Rubq
  class Adapter
    attr_reader :dataset, :table

    def initialize(options)
      @bigquery = Google::Cloud::Bigquery.new

      @dataset = @bigquery.dataset(options[:dataset] || 'default')
      @table = @dataset.table(options[:table])
    end
  end
end
