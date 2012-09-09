ActiveAdmin.register Post do
  index do
    column :title
    column :created_at
    default_actions
  end  

  controller do
    def create
      create! do |format|
        @post = Post.new(params[:post])
        User.all.each do |u|
          u.send_newsletter @post
        end
        format.html
      end
    end
  end
end
