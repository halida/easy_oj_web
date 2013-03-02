class AddChallengeIdToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :challenge_id, :integer
  end
end
