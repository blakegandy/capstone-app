class Appointment < ApplicationRecord
  belongs_to :stylist, foreign_key: :stylist_id, class_name: "User"
  belongs_to :client, foreign_key: :client_id, class_name: "User"
end
