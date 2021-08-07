class Volunteer < ApplicationRecord
  belongs_to :recruiter
  belongs_to :room
  has_many :images, dependent: :destroy
  has_many :customers, dependent: :destroy
  
  enum genre: { '国際': 0, '教育': 1, '災害': 2, 'まちづくり': 3, '農業': 4, '貧困': 5, '福祉': 6, 'スポーツ': 7, '動物愛護': 8, '環境': 9 }
  
end
