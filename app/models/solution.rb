class Solution < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem

  scope :by_user, lambda{ |user| where(user_id: user.id)}

  LANGUAGES = ['C', 'Java', 'Python']

  validates :language, inclusion: LANGUAGES

  def self.tester_get
    solution = Solution.where(status: nil).first
    return solution unless solution
    solution.update_attributes(status: 'testing')
    solution
  end

  def token
    generate_token if not self[:token]
    self[:token]
  end

  def status
    self[:status] || "Pending"
  end

  private
  def generate_token
    self[:token] = ::SecureRandom.hex(6)
    self.save
  end

end
