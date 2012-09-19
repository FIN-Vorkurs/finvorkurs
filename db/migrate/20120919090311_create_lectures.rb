class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.datetime :date
      t.string :name
      t.string :room
      t.text :description

      t.timestamps
    end
  end
end
