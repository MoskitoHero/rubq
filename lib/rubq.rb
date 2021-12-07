# frozen_string_literal: true

# require 'rubq'
require 'google/cloud/bigquery'

# Rubq allows access to Google Bigquery the rails way
module Rubq
  autoload :Adapter,        'rubq/adapter'
  autoload :Model,          'rubq/model'
  autoload :Migration,      'rubq/migration'
  autoload :Configuration,  'rubq/configuration'
  autoload :Inserter,       'rubq/inserter'
  autoload :Fieldset,       'rubq/fieldset'
  autoload :Error,          'rubq/error'

  # Error raised whenever a misconfiguration is found
  ConfigurationError = Class.new(Error)

  # Error raised when the adapter fails to insert a record in the database
  InsertionError = Class.new(Error)

  # Error raised when the provided data does not match the table Schema
  ValidationError = Class.new(Error)

  # @return [Logger]
  def self.logger
    @logger ||= Logger.new($stdout)
  end

  # @param [Logger] logger
  def self.logger=(logger)
    @logger = logger
  end

  # @return [Rubq::Adapter]
  def self.adapter
    @adapter ||= Adapter.new
  end

  def self.configure(&block)
    reset!
    adapter.configure(&block)
  end

  def self.reset!
    @adapter = nil
  end

  # @return [Rubq::Configuration]
  def self.configuration
    adapter.configuration
  end
end
