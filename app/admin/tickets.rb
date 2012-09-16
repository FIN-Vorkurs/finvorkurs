 ActiveAdmin.register_page "Tickets" do
  content do
    table do
      User.all(joins: :enrollments, group: :user_id).each do |user|
        render partial: 'ticket', locals: {user: user}
      end
    end
  end
end

