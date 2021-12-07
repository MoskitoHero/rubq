# frozen_string_literal: true

module Rubq
  module Model
    # All Rubq models inherit from Rubq::Model::Base
    #
    # For now, only the creation of a single row is possible
    class Base

      class << self
        # Create a row
        # @param fields [Hash] a hash of the fields representing the row to create
        # @return [TrueClass] if a row was created
        # @return [FalseClass] if a row was not created
        def create(fields)
          row = FieldSet.new(fields, schema).validate
          Inserter.new(table).insert(row)
        end

        # (see #create)
        # @note This method will raise an error if validation fails or if the row cannot be inserted
        def create!(fields)
          row = FieldSet.new(fields, schema).validate!
          Inserter.new(table).insert(row)
        end

        private

        # @return [Google::Cloud::Bigquery::Table]
        def table
          @table ||= Rubq.adapter.dataset.table(table_name)
        end

        # @return [Rubq::Schema]
        def schema
          @schema ||= Schema.new(self)
        end

        # @return [String]
        def table_name
          ancestors.first.to_s.pluralize.underscore
        end
      end
    end
  end
end
