module ApplicationHelper
  def active_class(path)
    if request.path == path
      'active'
    else
      ''
    end
  end

  def view_details_icon
    '<i class="icon-ok icon-white"></i> Do it@'.html_safe
  end

end
