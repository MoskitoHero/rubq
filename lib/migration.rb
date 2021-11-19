# frozen_string_literal: true

module Rubq
  class Migration
    class << self
      def bigquery
        @bigquery ||= Google::Cloud::Bigquery.new
      end

      def dataset(name)
        @dataset ||= bigquery.create_dataset(name)
      end
    end
  end
end
