module ApplicationHelper

  def twitterized_type(type)
    case type
      when :alert
        "alert alert-warning"
      when :error
        "alert alert-error"
      when :notice
        "alert alert-info"
      when :success
        "alert alert-success"
      else
        type.to_s
    end
  end

  def ie
    if request.env['HTTP_USER_AGENT'].match /MSIE/
      yield
    end
  end

end
