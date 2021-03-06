class Volunteer < ApplicationRecord
  belongs_to :recruiter
  has_one :room, dependent: :destroy
  has_many :volunteer_customers, dependent: :destroy
  has_many :applies, dependent: :destroy
  has_many :customers, dependent: :destroy, through: :volunteer_customers
  # attr_accessor :images_attributes
  has_many_attached :images


  enum genre: { '国際': 0, '教育': 1, '災害': 2, 'まちづくり': 3, '農業': 4, '貧困': 5, '福祉': 6, 'スポーツ': 7, '動物愛護': 8, '環境': 9, 'その他': 10 }
  enum volunteer_status: { '募集中': true, '募集終了': false}

  # バリデーション
  validates :name, presence: true
  validates :a_litle_explanation, presence: true
  validates :explanation, length: {maximum: 100}, presence: true
  validates :place, presence: true
  validates :time, presence: true
  validates :people, presence: true
  validates :merit, presence: true
  validates :necessary_item, presence: true
  validates :important_point, presence: true
  validates :comment, presence: true
  validates :limit, presence: true
  validates :genre, presence: true
  validate :image_length

  # 未読の通知があるか確認する
  def message_checked_customer
    Message.where(checked: false).any?
    # これだとMessageテーブルのカラムを見ているので誰かが閲覧するとfalseになってしまいます。
  end

  def message_checked_recruiter
    Message.where(checked: false).any?
  end

  # チャットルームがあれば@volunteerに紐づくRoomを作る
  def get_room
    if room != nil
      return room
    end
    return Room.create(volunteer_id:self.id)
  end


  # カスタマーがカスタマーボランティアに所属していればtrueを返す
  def customer_volunteer_in?(customer)
    customers.include?(customer)
  end

  private
  # ボランティアの投稿時の画像枚数指定
  def image_length
    if images.length<2
      images.purge
      errors.add(:images, "は3枚以上投稿してください")
    end
  end

end
