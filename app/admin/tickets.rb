 ActiveAdmin.register_page "Tickets" do
  content do
    table do
      User.all(joins: :enrollments, group: 'users.id, user.name').each do |user|
        render partial: 'ticket', locals: {user: user}
      end
    end
  end
end

