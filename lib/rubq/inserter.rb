# frozen_string_literal: true

module Rubq
  # The Inserter class is responsible for interacting with the table
  #
  # @attr_reader table [Google::Cloud::Bigquery::Table] the Bigquery table
  class Inserter
    attr_reader :table

    # @param table [Google::Cloud::Bigquery::Table] a Bigquery table to insert the row into
    # @return [Rubq::Inserter]
    def initialize(table)
      @table = table
    end

    # @param row [Hash] a hash of key/value pairs to be inserted
    # @raise [Rubq::InsertionError] if the fields do not validate against the schema
    # @return [Google::Cloud::Bigquery::InsertResponse]
    def insert(row)
      row[:created_at] =  Time.zone.now if row[:created_at].blank?
      row[:updated_at] =  Time.zone.now if row[:created_at].blank?
      response = table.insert(row)

      return true if response.success?

      raise Rubq::InsertionError, response.insert_errors.first.errors.first['message']
    end
  end
end
