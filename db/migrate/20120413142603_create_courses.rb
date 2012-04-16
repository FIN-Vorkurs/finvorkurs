class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.integer :fee
      t.date :from
      t.date :to
      t.references :test

      t.timestamps
    end
    add_index :courses, :test_id
  end
end
