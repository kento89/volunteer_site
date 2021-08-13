class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image
  belongs_to :volunteer, optional: true
  has_many :messages, dependent: :destroy
  
  enum experience: { '経験なし': 'false', '経験あり': 'true' }
  enum volunteer_status: { 'ボランティア予定なし': 'false', 'ボランティア予定あり': 'true' }
  
  # def unchecked_chats?
  #   my_rooms_ids = UserRoom.select(:room_id).where(customer_id: id)
  #   other_user_ids = UserRoom.select(:customer_id).where(room_id: my_rooms_ids).where.not(customer_id: id)
  #   Chat.where(customer_id: other_user_ids, room_id: my_rooms_ids).where.not(checked: true).any?
  # end
  
end
