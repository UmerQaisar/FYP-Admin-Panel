class ReportsController < ApplicationController
  before_action :create_firestore

  def index
    @user = @users_ref.doc(params[:patient_id]).get
    @reports = @users_ref.doc(params[:patient_id]).col("Reports").get
    @count = 0
  end
end
