ActiveAdmin.register Group do
  filter :course
  index do
    selectable_column
    column :id
    column 'Tutor', :user
    column :course
    column 'Users' do |group|
      group.users.count
    end
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

  form do |f|
    f.inputs 'Group' do
      if f.object.new_record?
        f.input :user
        f.input :course
      else
        f.input :user
        f.input :course
        f.input :enrollments, as: :check_boxes, collection: Enrollment.where('course_id = ?', f.object.course.id)
      end
    end
    f.buttons
  end

end
