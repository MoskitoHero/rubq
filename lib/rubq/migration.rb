# frozen_string_literal: true

module Rubq
  # Rubq::Migration defines Bigquery migrations
  #
  # Work in progress: This is still very rough and has to be streamlined.
  #
  # For now, you can just define an #up singleton method following
  # the Google::Cloud::Bigquery::Schema format.
  # @see https://googleapis.dev/ruby/google-cloud-bigquery/latest/Google/Cloud/Bigquery/Schema.html
  #
  # @example
  #    class CreateDeviceLogTable < Rubq::Migration
  #      def self.up
  #        adapter.create_table 'device_logs' do |t|
  #          t.schema do |schema|
  #            schema.integer 'battery'
  #            schema.integer 'uptime'
  #            schema.integer 'memory_used'
  #            schema.integer 'memory_total'
  #            schema.string 'version'
  #            schema.string 'imei'
  #            schema.timestamp 'created_at', mode: :required
  #            schema.timestamp 'updated_at', mode: :required
  #          end
  #          t.time_partitioning_type  = 'DAY'
  #          t.time_partitioning_field = 'created_at'
  #        end
  #      end
  #    end
  class Migration
    class << self
      private

      # @return [Rubq::Adapter] a Rubq::Adapter instance
      def adapter
        Rubq.adapter
      end
    end
  end
end
