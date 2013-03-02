class Problem < ActiveRecord::Base
  attr_accessible :demo_input, :demo_output, :desc, :input, :name, :output, :show_error, :user_id
end
