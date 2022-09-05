require 'net/http'
require 'uri'
require 'json'
require "google/cloud/firestore"

class UsersController < ApplicationController
  before_action :create_firestore

  def index
    @users = @users_ref.get
  end

  def show
    @user = @users_ref.doc(params[:id]).get
  end

  def destroy
    @user = @users_ref.doc(params[:id])
    if @user.get.exists?
      @user.delete
      redirect_to users_path
    end
  end

  private

  def create_firestore
    @firestore = Google::Cloud::Firestore.new project_id: 'login-app-dc785', keyfile: ENV['GOOGLE_KEY_FILE']
    @users_ref = @firestore.col('Users')
  end
end
