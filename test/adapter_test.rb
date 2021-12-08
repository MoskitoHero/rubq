# frozen_string_literal: true

require 'test_helper'

class AdapterTest < ActiveSupport::TestCase
  test 'it has a configuration' do
    assert Rubq::Adapter.new.configuration
    assert_instance_of Rubq::Configuration, Rubq::Adapter.new.configuration, msg = '#configuration must return an instance of Rubq::Configuration'
  end

  test 'it forwards the configuration' do
    adapter = Rubq::Adapter.new
    adapter.configure do |config|
      config.project = 'new_project'
    end
    assert_equal 'new_project', adapter.configuration.project
  end

  test 'it receives a configuration at initialization' do
    adapter = Rubq::Adapter.new(project: 'some_new_project', dataset: 'some_dataset', region: 'eu')
    assert_equal 'some_new_project', adapter.configuration.project
    assert_equal 'some_dataset', adapter.configuration.dataset
    assert_equal 'eu', adapter.configuration.region
  end

  test 'it cannot instantiate a connection with missing or lacking configuration' do
    assert_raises(ArgumentError) { Rubq::Adapter.new.connection }
    assert_raises(ArgumentError) { Rubq::Adapter.new(dataset: 'rubqdataset').connection }
  end

  test 'it has a connection' do
    adapter = Rubq::Adapter.new(project: 'rubq-project', dataset: 'rubqdataset')
    assert_instance_of Google::Cloud::Bigquery::Project, adapter.connection
  end

  test 'it has no dataset if it is not defined in GCP' do
    adapter = Rubq::Adapter.new(project: 'rubq-project', dataset: 'unexistingdataset')
    assert_instance_of NilClass, adapter.dataset
  end

  test 'it has a dataset' do
    adapter = Rubq::Adapter.new(project: 'rubq-project', dataset: 'rubqdataset')
    assert_instance_of Google::Cloud::Bigquery::Dataset, adapter.dataset
  end
end
