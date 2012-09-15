ActiveAdmin.register Group do
  filter :course
  index do
    selectable_column
    column :id
    column 'Tutor', :user
    column :course
    default_actions
  end

end
