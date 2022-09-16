require 'net/http'
require 'uri'
require 'json'
require "google/cloud/firestore"

module InitializeFirestore
  extend ActiveSupport::Concern

  def create_firestore
    @firestore = Google::Cloud::Firestore.new project_id: 'login-app-dc785', keyfile: SECRET_KEY_FILE
    @users_ref = @firestore.col('Users')
  end

  private
  SECRET_KEY_FILE = {
    "type": ENV["type"],
    "project_id": ENV[ "project_id"],
    "private_key_id": ENV["private_key_id"],
    "private_key": ENV["private_key"].gsub('//n', '/n'),
    "client_email": ENV[ "client_email"],
    "client_id": ENV["client_id"],
    "auth_uri": ENV["auth_uri"],
    "token_uri": ENV["token_uri"],
    "auth_provider_x509_cert_url": ENV["auth_provider_x509_cert_url"],
    "client_x509_cert_url": ENV["client_x509_cert_url"]
  }

end