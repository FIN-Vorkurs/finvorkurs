class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.references :user
      t.references :answer

      t.timestamps
    end
    add_index :replies, :user_id
    add_index :replies, :answer_id
  end
end
