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
end
