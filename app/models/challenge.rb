class Challenge < ActiveRecord::Base
  has_many :problems
  belongs_to :user
end
