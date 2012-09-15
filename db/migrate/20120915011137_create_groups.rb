class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :user
      t.references :course

      t.timestamps
    end
    add_index :groups, :user_id
    add_index :groups, :course_id
  end
end
