# ScopesRails


Manage scopes in Rails.

Without `scopes_rails`

```ruby
class User < ActiveRecord::Base

  state_machine :state do
    state :active
    state :removed
    state :lost
    state :beaten
    
    # .etc
  end
  
  scope :active, -> { where state: :active }
  scope :removed, -> { where state: :removed }
  scope :lost, -> { where state: :lost }
  scope :beaten, -> { where state: :beaten }
  
  # etc.
end
```

Using `scopes_rails`

```ruby
class User < ActiveRecord::Base
  state_machine :state do
    state :active
    state :removed
    state :lost
    state :beaten
    
    # .etc
  end
end
```

```shell
$ > rails generate scope user
create  app/scopes
create  app/scopes/user_scopes.rb
create  config/initializers/scopes_rails_initializer.rb
```

*app/scopes/user_scopes.rb*

```ruby
require 'scopes_rails/state_machine_scopes'

module UserScopes
  extend ActiveSupport::Concern
  include StateMachinesScopes

  #included do
  #end
end
```

```ruby
$ > rails c

> User.active
# output
```

Add your own scopes to the file.

*app/scopes/user_scopes.rb*

```ruby
require 'scopes_rails/state_machine_scopes'

module UserScopes
  extend ActiveSupport::Concern
  include StateMachinesScopes

  included do
    scope :alive, -> { where.not state: :beaten }
  end
end
```

Remove `StateMachineScopes` from scopes file if you don't need it.
