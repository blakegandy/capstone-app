class User < ApplicationRecord
  has_many :products
  has_many :stylist_appointments, class_name: "Appointments", foreign_key: "client_id"
  has_many :client_appointments, class_name: "Appointments", foreign_key: "stylist_id"
end
