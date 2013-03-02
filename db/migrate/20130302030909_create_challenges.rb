class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :desc
      t.integer :user_id
      t.integer :level

      t.timestamps
    end
  end
end
