class Volunteer < ApplicationRecord
  belongs_to :recruiter
  has_many :room, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :customers, dependent: :destroy

  attr_accessor :images_attributes

  enum genre: { '国際': 0, '教育': 1, '災害': 2, 'まちづくり': 3, '農業': 4, '貧困': 5, '福祉': 6, 'スポーツ': 7, '動物愛護': 8, '環境': 9 }
  enum volunteer_status: { '募集中': true, '募集終了': false}

end
