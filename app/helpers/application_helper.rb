module ApplicationHelper
  def flash_class(key)
    case key
    when 'notice'
      'success'
    when 'alert'
      'danger'
    when 'warning'
      'warning'
    else
      'info'
    end
  end
end
