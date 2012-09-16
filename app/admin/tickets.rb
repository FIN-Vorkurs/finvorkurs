 ActiveAdmin.register_page "Tickets" do
  content do
    table do
      User.all(select: 'DISTINCT users.*', joins: :enrollments).each do |user|
        render partial: 'ticket', locals: {user: user}
      end
    end
  end
end

