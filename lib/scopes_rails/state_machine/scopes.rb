module StateMachine::Scopes
  extend ActiveSupport::Concern

  included do
    List.states_list.each do |scope_name, query|
      scope scope_name, query
    end
  end
end
