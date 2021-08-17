class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :volunteer
  
  # チャットを既読にするメソッド
  def check_chats_notification(current_recruiter)
    # 結局この処理が誰かが既読にしてしまう処理です
    unchecked_messages = Message.volunteer.where(checked: false)
    unchecked_messages&.each { |unchecked_messages| unchecked_messages.update(checked: true) }
  end
  
end
