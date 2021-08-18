class Volunteer < ApplicationRecord
  belongs_to :recruiter
  has_many :images, dependent: :destroy
  has_many :customers, dependent: :destroy
  has_one :room, dependent: :destroy

  attr_accessor :images_attributes

  enum genre: { '国際': 0, '教育': 1, '災害': 2, 'まちづくり': 3, '農業': 4, '貧困': 5, '福祉': 6, 'スポーツ': 7, '動物愛護': 8, '環境': 9 }
  enum volunteer_status: { '募集中': true, '募集終了': false}
  
  # 未読の通知があるか確認する
  def message_checked_customer
    Message.where(checked: false).any?
    # これだとMessageテーブルのカラムを見ているので誰かが閲覧するとfalseになってしまいます。
  end
  
  def message_checked_recruiter
    Message.where(checked: false).any?
  end
  
  def get_room
    if room != nil
      return room
    end
    return Room.create(volunteer_id:self.id)
  end

end
