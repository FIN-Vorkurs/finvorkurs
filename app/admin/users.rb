ActiveAdmin.register User do
  menu priority: 2
  filter :id
  filter :email
  filter :name
  filter :present, as: :select

  member_action :pay, method: :put do
    user = User.find(params[:id])
    user.paid = !user.paid
    user.present = true
    user.save!
    redirect_to({action: :index}, notice: (user.paid? ? "#{user.name} set paid and present" : "#{user.name} set not paid"))
  end

  member_action :present, method: :put do
    user = User.find(params[:id])
    user.present = !user.present
    user.save!
    redirect_to({action: :index}, notice: (user.present? ? "#{user.name} is present" : "#{user.name} is not present"))
  end


  index do
    selectable_column
    id_column
    column :email
    column :name
    column "Courses" do |user|
      user.courses.count
    end
    column 'Present' do |user|
      if user.present?
        link_to 'present', present_admin_user_path(user), method: :put
      else
        link_to 'not present', present_admin_user_path(user), method: :put
      end
    end

    column 'Paid' do |user|
      if user.paid?
        link_to 'paid', pay_admin_user_path(user), method: :put
      else
        link_to 'not paid', pay_admin_user_path(user), method: :put
      end
    end
    default_actions
  end 

  show do |user|
    attributes_table do
      row :id
      row :email
      row :name
      row :created_at
      row 'Test Results' do
        ul do
          user.test_results.each do |t|
            li "#{t.course.title} #{t.score}%"
          end
        end
      end

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
