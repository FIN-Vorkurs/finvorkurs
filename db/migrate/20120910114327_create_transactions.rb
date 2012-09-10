class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :payee
      t.string :subject
      t.string :category
      t.decimal :amount, precision: 16, scale: 2
      t.text :notes

      t.timestamps
    end
  end
end
