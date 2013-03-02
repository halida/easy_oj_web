class Challenge < ActiveRecord::Base
  has_many :problems, dependent: :destroy
  belongs_to :user
end
