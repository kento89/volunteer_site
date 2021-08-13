class UserRoom < ApplicationRecord
  # belongs_to :customer
  # belongs_to :recruiter
  # belongs_to :room
  # has_many :messages, through: :room
  
  # def self.find_customer_rooms(current_customer, other_customer)
  #   rooms_ids = current_customer.customer_rooms.pluck(:room_id)
  #   UserRoom.find_by(customer_id: other_customer.id, room_id: rooms_ids)
  # end

  
end
