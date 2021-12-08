# frozen_string_literal: true

require 'test_helper'

class RubqTest < ActiveSupport::TestCase
  test 'it has a version number' do
    assert Rubq::VERSION
  end

  test 'it has a logger' do
    assert Rubq.logger
    assert_instance_of Logger, Rubq.logger, msg = '#logger must return an instance of Logger'
  end

  test 'it has an adapter' do
    assert Rubq.adapter
    assert_instance_of Rubq::Adapter, Rubq.adapter, msg = '#adapter must return an instance of Rubq::Adapter'
  end

  test 'it can reset the adapter' do
    first_adapter = Rubq.adapter
    Rubq.reset!
    refute_same first_adapter, Rubq.adapter, msg = '#adapter must change after calling reset!'
  end

  test 'it has a configuration' do
    assert Rubq.configuration
    assert_instance_of Rubq::Configuration, Rubq.configuration, msg = '#configuration must return an instance of Rubq::Configuration'
  end

  test 'it passes the configuration to the Adapter' do
    Rubq.configure do |config|
      config.project = 'new_project'
    end
    assert_equal 'new_project', Rubq.configuration.project
    assert_equal Rubq.configuration.project, Rubq.adapter.configuration.project
  end
end
