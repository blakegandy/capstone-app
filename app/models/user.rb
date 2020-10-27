class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :products
  # has_many :stylist_appointments, class_name: "Appointments", foreign_key: "client_id"
  # has_many :client_appointments, class_name: "Appointments", foreign_key: "stylist_id"

  def stylist_appointments
    Appointment.where("stylist_id = ?", id)
  end
  def client_appointments
    Appointment.where("client_id = ?", id)
  end
end
