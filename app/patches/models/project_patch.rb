require_dependency 'project'

module Models
  module ProjectPatch

    extend ActiveSupport::Concern

    included do
      has_many :default_queries, dependent: :delete_all, class_name: 'ProjectsDefaultQuery'
    end

    def default_query
      default_queries.first.try :query
    end

    def init_default_query
      default_queries.first || default_queries.new
    end
  end
end

Models::ProjectPatch.tap do |mod|
  Project.send :include, mod unless Project.include?(mod)
end
