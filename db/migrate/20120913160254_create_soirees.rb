class CreateSoirees < ActiveRecord::Migration
  def change
    create_table :soirees do |t|
      t.datetime :date
      t.string :place
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
