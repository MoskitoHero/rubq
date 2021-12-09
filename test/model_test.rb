# frozen_string_literal: true

require 'test_helper'

class ModelTest < ActiveSupport::TestCase
  test 'it has a table' do
    table = Payload.send(:table)
    assert_instance_of Google::Cloud::Bigquery::Table, table
  end

  test '#create instanciates an Inserter with a table and a inserts a row' do
    mock_inserter = Minitest::Mock.new
    mock_inserter.expect(:insert, true, [ data: 'string content' ])
    Rubq::Inserter.stub :new, mock_inserter do
      Payload.create(data: 'string content')
    end
  end

  test '#create instanciates a Fieldset with fields, a schema, and calls #validate' do
    mock_fieldset = Minitest::Mock.new
    mock_fieldset.expect(:validate, { data: 'string content' })
    Rubq::Fieldset.stub :new, mock_fieldset do
      Payload.create(data: 'string content')
    end
  end

  test '#create! instanciates an Inserter with a table and a inserts a row' do
    mock_inserter = Minitest::Mock.new
    mock_inserter.expect(:insert, true, [ data: 'string content' ])
    Rubq::Inserter.stub :new, mock_inserter do
      Payload.create!(data: 'string content')
    end
  end

  test '#create! instanciates a Fieldset with fields, a schema, and calls #validate!' do
    mock_fieldset = Minitest::Mock.new
    mock_fieldset.expect(:validate!, { data: 'string content' })
    Rubq::Fieldset.stub :new, mock_fieldset do
      Payload.create!(data: 'string content')
    end
  end
end
