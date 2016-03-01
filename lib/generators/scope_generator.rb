class ScopeGenerator < Rails::Generators::NamedBase
  def create_scope_file
    empty_directory 'app/scopes/'
    create_file "app/scopes/#{file_name}_scopes.rb", <<-FILE
module #{class_name}Scopes
  extend ActiveSupport::Concern

  included do
  end
end
    FILE
  end
end
