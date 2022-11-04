class ReportsController < ApplicationController
  before_action :create_firestore
  before_action :authenticate_doctor!, only:[:prescription, :add_prescription]
  before_action :authenticate_admin!, only:[:delete_reports]
  before_action :get_user_and_reports, except: [:prescription]
  before_action :get_prescription_ref, only: [:add_prescription, :prescription]

  def index
    @reports = @reports_ref.get
    @count = 0
  end

  def category
    @reports = @reports_ref.where("category", "=", params[:category]).get
    @count = 0
  end

  def prescription
    @patient_id = params[:patient_id]
    @prescriptions = @prescription_ref.get
  end

  def add_prescription
    prescription_text = params[:prescription]
    if prescription_text.empty?
      redirect_to "/prescription/#{params[:patient_id]}", alert: 'Prescription Text is Empty'
    else
      prescription_hash = {
        doctorName: current_doctor.name,
        doctorEmail: current_doctor.email,
        createdAt: DateTime.now,
        prescription: prescription_text
      }
      @prescription_ref.add prescription_hash
      # sending email to user
      get_patient_email
      PrescriptionMailer.send_prescription_email(@email,current_doctor.email, current_doctor.name, prescription_text).deliver
      redirect_to "/prescription/#{params[:patient_id]}", notice: 'Prescription Added'
    end
  end

  def delete_reports
    @report = @reports_ref.doc(params[:report_id])
    if @report.get.exists?
      @report.delete
      redirect_to get_reports_path(patient_id: params[:patient_id])
    end
  end

  private

  def get_prescription_ref
    @prescription_ref = @users_ref.doc(params[:patient_id]).col("Prescriptions")
  end

  def get_user_and_reports
    @user = @users_ref.doc(params[:patient_id]).get
    @categories = @users_ref.doc(params[:patient_id]).col("Categories").get
    @reports_ref = @users_ref.doc(params[:patient_id]).col("Reports")
  end

  def get_patient_email
    @email =  @users_ref.doc(params[:patient_id]).get[:email]
  end
end
