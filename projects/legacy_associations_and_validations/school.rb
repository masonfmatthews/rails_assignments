class School < ActiveRecord::Base

  default_scope { order('name') }
end
