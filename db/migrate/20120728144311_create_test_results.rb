class CreateTestResults < ActiveRecord::Migration
  def change
    create_table :test_results do |t|
      t.integer :score
      t.references :course
      t.references :user

      t.timestamps
    end
    add_index :test_results, :course_id
    add_index :test_results, :user_id
  end
end
