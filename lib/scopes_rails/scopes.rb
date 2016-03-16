require 'scopes_rails/state_machine/list'

module ScopesRails
  module ScopesList
    extend ActiveSupport::Concern

    module ClassMethods
      def scopes
        added_scopes_list = []
        included_sector = false
        File.foreach("app/scopes/#{model_name.to_s.underscore}_scopes.rb") do |line|
          included_sector = true if line == '  included do'
          if included_sector && line.match?(/scope :[a-z0-9]*, .*/)
            added_scopes_list << line[/:[0-9a-z]*/][1..-1]
          end
        end
        added_scopes_list + StateMachine::List.states_list(self).keys
      end
    end
  end
end

ActiveRecord::Base.send :include, ScopesRails::ScopesList
