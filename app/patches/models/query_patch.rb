require_dependency 'query'

module Models
  module QueryPatch
    extend ActiveSupport::Concern

    included do
      scope :only_public, -> { where(visibility: Query::VISIBILITY_PUBLIC) }
    end
  end
end

Models::QueryPatch.tap do |mod|
  Query.send :include, mod unless Query.include?(mod)
end
