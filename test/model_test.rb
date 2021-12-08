# frozen_string_literal: true

require 'test_helper'

class ModelTest < ActiveSupport::TestCase
  test 'it has a table' do
    table = Payload.send(:table)
    assert_instance_of Google::Cloud::Bigquery::Table, table
  end
end
