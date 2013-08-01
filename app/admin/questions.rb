ActiveAdmin.register Question do
  
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
    f.inputs 'question' do
      f.input :course
      f.input :text
    end

    f.has_many :answers do |answer|
      answer.inputs do
        answer.input :text
        answer.input :correct, label: 'korrekte Antwort'
        if !answer.object.nil?
          answer.input :_destroy, :as => :boolean, label: 'löschen'
        end
      end
    end
    f.buttons
  end

end
