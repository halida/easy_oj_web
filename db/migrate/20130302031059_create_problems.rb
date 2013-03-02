class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :name
      t.text :desc
      t.integer :user_id
      t.boolean :show_error
      t.text :demo_input
      t.text :demo_output
      t.text :input
      t.text :output

      t.timestamps
    end
  end
end
