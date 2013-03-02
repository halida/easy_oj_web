class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.integer :user_id
      t.integer :problem_id
      t.text :text
      t.string :language
      t.string :token
      t.string :status
      t.text :result

      t.timestamps
    end
  end
end
