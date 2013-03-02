class Challenge < ActiveRecord::Base
  attr_accessible :desc, :level, :name, :user_id
end
