class Solution < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem

  scope :by_user, lambda{ |user| where(user_id: user.id)}

  LANGUAGES = ['C', 'Java', 'Python']

  validates :language, inclusion: LANGUAGES
  
  state_machine :status, :initial => :pending do
    state :testing  # the solution is now testing by SolutionCheck Worker
    state :tested   # SolutionCheck Worker run the solution and the result is given 

    event :start_test do
      transition :pending => :testing
    end

    event :finish_test do
      transition :testing => :tested
    end
  end

  def self.tester_get
    solution = Solution.with_status(:pending).first
    return solution unless solution
    solution.start_test
    solution
  end

  def token
    generate_token if not self[:token]
    self[:token]
  end

  private
  def generate_token
    self[:token] = ::SecureRandom.hex(6)
    self.save
  end

end
