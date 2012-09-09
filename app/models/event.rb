class Event

  def self.since time
    events = []
    events += Enrollment.where('created_at > ?', time)
    events += TestResult.where('created_at > ?', time)
    events += User.where('created_at > ?', time)
    events.sort_by(&:created_at).reverse
  end

end
