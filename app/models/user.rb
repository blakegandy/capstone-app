class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :products
  has_many :stylist_appointments, class_name: "Appointment", foreign_key: "client_id"
  has_many :client_appointments, class_name: "Appointment", foreign_key: "stylist_id"

  def appointments
    Appointment.where("stylist_id = ? OR client_id = ?", id, id)
  end
  # def client_appointments
  #   Appointment.where("client_id = ?", id)
  # end
end
