class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :messages, dependent: :destroy
  has_many :volunteer_customers, dependent: :destroy
  has_many :applies, dependent: :destroy
  has_many :volunteers, through: :volunteer_customers
  has_many :notifications, dependent: :destroy

  enum experience: { '経験なし': false, '経験あり': true }
  enum volunteer_status: { 'ボランティア予定なし': false, 'ボランティア予定あり': true }

# バリデーション
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_number, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :experience, presence: true
  validates :comment, length: {maximum: 200}, presence: true
  
end
