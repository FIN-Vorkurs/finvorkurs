class ChangeDataTypeForQuestionText < ActiveRecord::Migration
  def up
    change_table :questions do |t|
      t.change :text, :text
    end
  end

  def down
    change_table :questions do |t|
      t.change :text, :string
    end
  end
end
