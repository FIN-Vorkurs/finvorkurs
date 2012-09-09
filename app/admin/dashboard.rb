ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  action_item do
    link_to "Main Site", root_url
  end

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Users" do
          ul do
            User.last(5).map do |user|
              li link_to(user.email, admin_user_path(user))
            end
          end
        end
      end

      column do
        panel "Recent Posts" do
          ul do
            Post.last(5).map do |post|
              li link_to(post.title, admin_post_path(post))
            end
          end
        end
      end
    end

    panel "Events" do
      table_for Event.all do |event|
        column :created_at
        column :message
      end
    end

  end
end
