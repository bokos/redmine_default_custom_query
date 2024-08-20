Redmine::Plugin.register :redmine_default_custom_query do
  name 'Redmine Default Custom Query'
  author 'Katsuya Hidaka'
  description 'Redmine plugin for setting default custom query of Issues for each project'
  version '1.5.0'
  requires_redmine '4.0'
  url 'https://github.com/hidakatsuya/redmine_default_custom_query'
  author_url 'https://twitter.com/hidakatsuya'

  project_module :default_custom_query do
    permission :manage_default_query, { default_custom_query_setting: [ :update ] }, require: :member
  end
end

require File.expand_path('../lib/default_custom_query', __FILE__)

include DefaultCustomQueryHelper
