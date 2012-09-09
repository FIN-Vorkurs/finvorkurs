ActiveAdmin.register User do
  config.paginate = false
  menu priority: 2
  filter :id
  filter :email
  filter :name

  index do
    column :id
    column :email
    column :name
    column "Courses" do |user|
      user.courses.count
    end
    default_actions
  end 

  show do |user|
    attributes_table do
      row :id
      row :email
      row :name
      row :created_at
      row "Enrollments" do
        ul do
          user.enrollments.each do |enrollment|
            li enrollment.course.title
          end
        end
      end
    end
  end

  form do |f|
    f.inputs "User" do
      f.input :email
      f.input :name
      f.input :role, as: :select, collection: {'User' => 0, 'Tutor' => 1, 'Admin' => 2}
    end
    f.buttons
  end
end
