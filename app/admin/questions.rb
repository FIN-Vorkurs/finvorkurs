# encoding: UTF-8
ActiveAdmin.register Question do
  config.clear_sidebar_sections!

  index do

    scope :all, default: true
    Course.all.each do |course|
      scope course.title do
        Question.where "course_id = ?", course
      end
    end

    selectable_column
    column :text
    default_actions
  end

  show do |question|

    attributes_table do
      row :course
      row :text
    end

    panel pluralize question.answers.count, "Answer" do
      table_for question.answers do |answer|
        column :text
        column :correct
      end
    end

  end

  form do |f|
    f.inputs do
      f.input :course
      f.input :text
    end

    f.has_many :answers do |answer|
      answer.input :text
      answer.input :correct, label: 'correct'
      if !answer.object.nil?
        answer.input :_destroy, :as => :boolean, label: 'delete'
      end
    end
    f.buttons
  end

end
