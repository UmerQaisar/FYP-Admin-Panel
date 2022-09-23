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

  def is_reports_path
    request.path.include? "/reports/#{params[:patient_id]}"

  end

  def is_prescription
    request.path == "/prescription/#{params[:patient_id]}"
  end
end
