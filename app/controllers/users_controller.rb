class UsersController < ApplicationController
  before_action :create_firestore
  before_action :authenticate_admin!, except: [:doctor_profile]
  before_action :authenticate_doctor!, only:[:doctor_profile]


  def index
    @users = @users_ref.get
  end

  def show
    @user = @users_ref.doc(params[:id]).get
    @reports = @users_ref.doc(params[:id]).col("Reports").get
    @count = 0
  end

  def destroy
    @user = @users_ref.doc(params[:id])
    if @user.get.exists?
      @user.delete
      redirect_to users_path
    end
  end

  def doctor_profile
    @doctor = current_doctor
  end
end
