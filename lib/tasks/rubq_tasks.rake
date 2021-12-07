# frozen_string_literal: true

namespace :rubq do
  desc "Migrate the database"
  task migrate: :environment do
    paths = Rails.application.paths["bq/migrate"].to_a
    paths.each do |path|
      require path

    end
  end
end
