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
    "type": "service_account",
    "project_id": "login-app-dc785",
    "private_key_id": "0a56bc8991762d05456011637dc7c94976c2e88a",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC4S/RUCo96anSz\n5cUYG8vEL2xdvMgHg/3rrR4VrVLD1UORbyUSKIQ+W3geBwOPLRJ9tkVChrdqhvGE\n0ucavoRGdnJuhesMxQoprfceWMnPfnztWTydFwLcAX/jtmudOS/R/BntOpIW6WcB\nb2WskqKaoKhK7O8zoZRz4b+3fVFATc11LyUaRNzj/09wVWCvHaQigV9010h9zgmR\nnC43UBUY7O9nVbseqtL2DV1XwCLpknG1KD9sUqPxjLFDzauSg9aG9P+Y3/VbYHcR\nufLDsoxyEshsyoaaZGD/9hH0dWngUGKkGAoiBz2QxGfqVFQuy6tDSpKiLL6oBjPh\nMgi+LkZBAgMBAAECggEACjDSAHUqiKB7Fkj/6GS+FFmydm72SRsadvYWRijUvSUt\nZKz2ie3hXSDZ8CAfaWL6xSaHZyWznfF7CKcQViVfg1Vwn62qSQUauiIHWn9anm1+\nOzIeZMnVU8TF9Xmccv/K5gO4i8p7skZi9px6LOwZT29PiwAVvH9EahF7NEpazDFA\n2+XqcG8R84n/68z/wiV1R75sQTWcS2PnYN6M6sj43XIUHhcYWVqAw0VQ1NaYdfAC\nI9IRBEXZyioBp0KXc2aaCkInYsM8DCLyup7TRsyYy6hD81vexiKJfannefyS+a2S\nry6FfKlug55IY16ib60lFdB4AJfqNfFFPF/3QU6+CQKBgQD9HaVoNCIJFT7bLsjo\nUBDYrO2T++0YlytXOOfva+pTVzNK3w81F3GjHG9Sf1ebrx6+IkrmEls7A1nc9djR\nOwOHkbn823tKVAjYkztSY70J1u7KXwscVQGSurUiOSlCDRRpOBTT4u/MD+FJISHj\nctE+YN7WobE23ypoRWUVzW+GOQKBgQC6ZY8Qs1flnFWFjRSDzhyCVHVEute7QJN4\nzDEu2YipT7ZD2tU1UFcRwS/nP407gYVG9IEwiAaliC2z9TZHkIzcSdH2ukbF71m/\ndjL5upx8Jpf4mv4cIZDbGHuECS1pOzC3brxEFpn4O6m2vr2F3GgCRR0T9NUVcSOy\naguL/GkASQKBgD0JtSWXzM1b7jh048YB6M4XhYM2MUrIyY7TDjtSTsOiN6BKgiRP\nbvvik4XVZ48Hf+Zh5qXsr0tf13/NWWe7T3KV1cAAPY8DDM8NUjTgEGobBqKOoONI\nLITxuVRzbFudQ9rLx1oBU8pl2fIEp2NuAL+GJLalb1LIJjXW5jWHwOkhAoGAQ9aq\nlv1uxBZ92bla+g2NurFabMVDttbt1U0bqV1qq5RjVZbTei/fQIr7EELE+B9Pjl92\nlV8sbBp/57sbIjity47iZ9Wr5GYUV+aA7vrH8TdqoARo73wX6GWkro1YhbARLvGS\ne4VuTDYKsoQBHjL1d74HszesRb2DrG+D/FLFNGECgYA5G4no+grLnQnBDuweekIY\nDNBj5ah0p6lg5CXwmK7JdTOvPHTzcLTVgFUwtbdnIGmg+ZiFm/QkF1n38UfSDSR2\nfKdONnPfj3DD2jmAECvboODss8d95L4kV6hvygxCXvd3RTthT4+EMwT9ME3Fch5y\n+FstbbwRoVKA4ii+pX1FGg==\n-----END PRIVATE KEY-----\n",
    "client_email": "firebase-adminsdk-nk0a0@login-app-dc785.iam.gserviceaccount.com",
    "client_id": "114384118006331663699",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-nk0a0%40login-app-dc785.iam.gserviceaccount.com"
  }
end