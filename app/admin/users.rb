ActiveAdmin.register User do
  menu priority: 2
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
end
