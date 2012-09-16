class AddPresentToUser < ActiveRecord::Migration
  def change
    add_column :users, :present, :boolean, default: false
  end
end
