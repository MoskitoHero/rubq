# frozen_string_literal: true

require 'test_helper'

class ModelTest < ActiveSupport::TestCase
  test 'it returns an instance of Rubq::Adapter' do
    assert_instance_of Rubq::Adapter, Rubq::Model.adapter,
                       msg = 'Model#adapter must return an instance of Rubq::Adapter'
  end
end
