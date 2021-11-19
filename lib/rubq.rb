# frozen_string_literal: true

require 'rubq'
require 'google/cloud/bigquery'

# Rubq allows access to Google Bigquery the rails way
module Rubq
  autoload :Adapter,      'rubq/adapter'
  autoload :Model,        'rubq/model'
  autoload :Migration,    'rubq/migration'
end
