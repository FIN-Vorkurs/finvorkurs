class Event < ActiveRecord::Base

  def self.columns() @columns ||= []; end
 
  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end

  column :created_at, :date
  column :message, :string

  def self.all
    enrollment_events = self.enrollment_events
    test_result_events = self.test_result_events
    
    enrollment_events + test_result_events
  end

  def self.enrollment_events
    enrollments = Enrollment.where 'created_at >= ?', 24.hours.ago
    enrollments.map do |enrollment|
      enrollment_event = Event.new
      enrollment_event.created_at = enrollment.created_at
      enrollment_event.message = "#{enrollment.user.name} has enrolled to #{enrollment.course.title}"
      enrollment_event
    end
  end

    def self.test_result_events
    test_results = TestResult.where 'created_at >= ?', 24.hours.ago
    test_results.map do |test_result|
      test_result_event = Event.new
      test_result_event.created_at = test_result.created_at
      test_result_event.message = "#{test_result.user.email} finished the test for #{test_result.course.title} with #{test_result.score} %"
      test_result_event
    end
  end


end
