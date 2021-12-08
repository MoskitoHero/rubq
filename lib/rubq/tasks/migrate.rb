# frozen_string_literal: true

module Rubq
  module Tasks
    class Migrate
      def call
        paths = Rails.application.paths["bq/migrate"].to_a
        paths.each do |path|
          require path

        end
      end
    end
  end
end
