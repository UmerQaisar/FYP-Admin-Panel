require 'net/http'
require 'uri'
require 'json'
require "google/cloud/firestore"

module InitializeFirestore
  extend ActiveSupport::Concern

  def create_firestore
    @firestore = Google::Cloud::Firestore.new project_id: 'login-app-dc785', keyfile: ENV['GOOGLE_APPLICATION_CREDENTIALS']
    @users_ref = @firestore.col('Users')
  end
end