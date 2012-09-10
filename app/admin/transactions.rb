ActiveAdmin.register Transaction do
  index do
    h2 "Balance: EUR #{Transaction.all.inject(0) { |a, e| a + e.amount }}"
    selectable_column
    column 'Date', :created_at
    column :payee
    column :subject
    column :category
    column :amount
    default_actions
  end
end
