class ScopeGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../../scopes_rails/templates', __FILE__)

  def create_scope_file
    empty_directory 'app/scopes/'
    create_file "app/scopes/#{file_name}_scopes.rb", <<-FILE
require 'scopes_rails/state_machine_scopes'

module #{class_name}Scopes
  extend ActiveSupport::Concern
  include StateMachineScopes

  #included do
  #end
end
    FILE

    copy_file 'scopes_rails_initializer.rb', 'config/initializers/scopes_rails_initializer.rb'
    empty_directory 'lib/middleware'
    copy_file 'scopes_rails_middleware.rb', 'lib/middleware/scopes_rails_middleware.rb'
    copy_file 'scopes_rails_including.rb', 'lib/middleware/scopes_rails_including.rb'
  end
end
