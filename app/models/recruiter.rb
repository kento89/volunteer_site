class Recruiter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  has_many :volunteers, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :notifications, dependent: :destroy

  # バリデーション
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :email, presence: true
  validates :postal_number, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :image_attached, presence: true
  
  private
  # 画像指定
  def image_attached
    unless image.attached?
      image.purge
      errors.add(:images, "を登録して下さい")
    end
  end
  
end
