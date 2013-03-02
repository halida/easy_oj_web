class Problem < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :user

  has_many :solutions
end
