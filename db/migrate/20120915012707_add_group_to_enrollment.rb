class AddGroupToEnrollment < ActiveRecord::Migration
  def change
    add_column :enrollments, :group_id, :integer
    add_index :enrollments, :group_id
  end
end
