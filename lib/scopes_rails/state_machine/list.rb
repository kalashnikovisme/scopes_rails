module StateMachine::List
  def self.states_list
    list = []
    if ancestors.first.methods.include? :state_machines
      state_machines.each do |name, sm|
        sm.states.each do |s|
          state_name = sm.namespace.present? ? :"#{sm.namespace}_#{s.name}" : s.name
          list << { state_name => -> { where(name => s.name) } }
        end
      end
    end
    list
  end
end
