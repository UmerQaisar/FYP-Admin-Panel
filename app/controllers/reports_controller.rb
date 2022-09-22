class ReportsController < ApplicationController
  before_action :create_firestore
  before_action :get_user

  def index
    @reports = @users_ref.doc(params[:patient_id]).col("Reports").get
    @count = 0
  end

  def category
    @reports = @users_ref.doc(params[:patient_id]).col("Reports").where("category", "=", params[:category]).get
    @count = 0
  end

  private
  def get_user
    @user = @users_ref.doc(params[:patient_id]).get
    @categories = @users_ref.doc(params[:patient_id]).col("Categories").get
  end
end
