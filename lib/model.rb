# frozen_string_literal: true

module Rubq
  class Model
    class << self
      def create(fields)
        row = sanitize(fields)
        row[:created_at] =  Time.zone.now
        row[:updated_at] =  Time.zone.now
        adapter.table.insert row
      end

      def sanitize(fields)
        fields.as_json
      end

      def create!(fields)
        response = create(fields)
        return response if response.success?

        raise StandardError, 'could not insert this row'
      end

      def adapter
        Rubq::Adapter.new(dataset: @dataset, table: ancestors.first.to_s.pluralize.underscore)
      end

      def dataset(name)
        @dataset = name
      end
    end
  end
end
