class PrescriptionMailer < ApplicationMailer

  def send_prescription_email(email, doctor_email, doctor_name, prescription)
    @email = email
    @doctor_email = doctor_email
    @prescription = prescription
    mail( to: @email, subject: "#{doctor_name} have written a prescription for you")
  end
end
