class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :course
      t.string :text

      t.timestamps
    end
    add_index :questions, :course_id
  end
end
