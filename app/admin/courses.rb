ActiveAdmin.register Course do
  config.filters = false 
  index do |course|
    column :title
    column :fee
    column :from
    column :to
    column 'Enrollments' do |course|
      course.enrollments.count
    end
    default_actions
  end

  show do |course|
    attributes_table do
      row :title
      row :fee
      row :from
      row :to
    end

    panel pluralize course.enrollments.count, "Enrollment" do
      table_for course.enrollments do
        column :user
        column 'Score' do |enrollment|
          enrollment.user.test_results.where('course_id = ?', enrollment.course.id).first.score
        end
        column 'Group' do |enrollment|
          enrollment.group
        end
        column :created_at
      end
    end

  end
end
