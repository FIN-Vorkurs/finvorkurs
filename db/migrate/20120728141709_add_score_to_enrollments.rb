class AddScoreToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :score, :integer
  end
end
