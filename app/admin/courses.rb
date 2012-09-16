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
      table_for Enrollment.all(joins: {user: :test_results}, conditions: {course_id: course.id, 'test_results.course_id' => course.id}, order: 'test_results.score ASC') do |enrollment|
        column :user
        column :created_at
      end
    end

  end
end
