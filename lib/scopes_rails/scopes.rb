class ActiveRecord::Base
  def list
    added_scopes_list + StateMachine::List.states_list.keys
  end

  private

  def added_scopes_list
    list = []
    included_sector = false
    File.foreach("app/scopes/#{model_name.to_s.underscore}_scopes.rb") do |line|
      included_sector = true if line == '  included do'
      if included_sector && line.match?(/scope :[a-z0-9]*, .*/)
        list << line[/:[0-9a-z]*/][1..-1]
      end
    end
    list
  end
end
