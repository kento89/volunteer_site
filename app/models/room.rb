class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :notifications, dependent: :destroy
  belongs_to :volunteer
  
end
