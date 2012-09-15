ActiveAdmin.register Group do
  filter :course
  index do
    selectable_column
    column :id
    column 'Tutor', :user
    column :course
    default_actions
  end

  show do |group|
    attributes_table do
      row :id
      row :user
      row :course
    end

    panel pluralize group.users.count, "User" do
      table_for group.users do |user|
        column :name
      end
    end
  end

end
