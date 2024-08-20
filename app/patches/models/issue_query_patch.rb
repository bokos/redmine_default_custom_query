require_dependency 'issue_query'

module Models
  module IssueQueryPatch
    extend ActiveSupport::Concern

    included do
      has_many :projects_default_queries, dependent: :nullify, foreign_key: :query_id
    end

    def public_visibility?
      visibility == Query::VISIBILITY_PUBLIC
    end
  end
end

Models::IssueQueryPatch.tap do |mod|
  IssueQuery.send :include, mod unless IssueQuery.include?(mod)
end
