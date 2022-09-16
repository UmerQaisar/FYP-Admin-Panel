class HomeController < ApplicationController
  before_action :create_firestore

  def homepage
  end

  def get_reports
    patient_id = params[:id].delete(' ')
    if patient_id.empty?
      redirect_to root_path, notice: 'Patient ID should not be empty'
    elsif @users_ref.doc(patient_id).get.exists?
      redirect_to "/reports/#{patient_id}"
    else
      redirect_to root_path, alert: 'Please Enter a Valid Patient ID'
    end
  end

end