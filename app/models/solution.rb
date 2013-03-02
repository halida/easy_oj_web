class Solution < ActiveRecord::Base
  attr_accessible :language, :problem_id, :result, :status, :text, :token, :user_id
end
