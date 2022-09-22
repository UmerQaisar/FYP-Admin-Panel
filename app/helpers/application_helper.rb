module ApplicationHelper
  def active_class(path)
    if request.path == path
      'active'
    else
      ''
    end
  end

  def active_category(category, current_category)
    if category == current_category
      'btn btn-dark'
    else
      'btn btn-outline-dark'
    end
  end

end
