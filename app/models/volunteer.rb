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
    return Room.create() # 必要なパラメータ設定してあげる
  end
  
  # 検索scope
  scope :search, -> (search_params) do
    return if search_params.blank?

    name_like(search_params[:name])
      .genre_is(search_params[:genre])
      .limit_to(search_params[:limit])
  end
  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }
  scope :genre_is, -> (genre) { where(genre: genre) if genre.present? }
  scope :limit_to, -> (limit) { where('limit <= ?', limit) if to.present? }
  
end
