# frozen_string_literal: true

require 'rubq/tasks'

namespace :rubq do
  desc "Migrate the database"
  task migrate: :environment do
    Rubq::Tasks::Migrate.call
  end
end
