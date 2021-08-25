class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :messages, dependent: :destroy
  has_many :volunteer_customers, dependent: :destroy
  has_many :applies, dependent: :destroy
  has_many :volunteers, through: :volunteer_customers
  has_many :notifications, dependent: :destroy

  enum experience: { '経験なし': 'false', '経験あり': 'true' }
  enum volunteer_status: { 'ボランティア予定なし': 'false', 'ボランティア予定あり': 'true' }

end
