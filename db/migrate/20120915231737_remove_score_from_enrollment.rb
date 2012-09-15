class RemoveScoreFromEnrollment < ActiveRecord::Migration
  def change
    remove_column :enrollments, :score
  end
end
