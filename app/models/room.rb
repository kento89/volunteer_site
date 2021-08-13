class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  # has_many :user_rooms, dependent: :destroy
  belongs_to :volunteer
  
  # def check_chats_notification(current_customer)
  #   unchecked_messages = messages.includes(:customer).where(checked: false).where.not(customer_id: current_customer.id)
  #   unchecked_messages&.each { |unchecked_message| unchecked_message.update(checked: true) }
  # end
  
end
