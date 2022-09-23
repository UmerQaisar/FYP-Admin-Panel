class ReportsController < ApplicationController
  before_action :create_firestore
  before_action :authenticate_doctor!, only:[:prescription, :add_prescription]
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
      redirect_to "/prescription/#{params[:patient_id]}", notice: 'Prescription Added'
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
end
