# frozen_string_literal: true

module Rubq
  module Generators
    class MigrationGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)
      argument :name, required: true, desc: 'The name of the migration'

      def migration
        timestamp = Time.now.utc.strftime('%Y%m%d%H%M%S')
        @migration_name = name.camelized
        @table_name = name.underscore.sub('create_', '').pluralize
        template 'migration.erb', "bq/migrate/#{timestamp}_#{name.underscore}"
      end
    end
  end
end
