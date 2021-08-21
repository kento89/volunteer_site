class Message < ApplicationRecord
  has_many :notifications, dependent: :destroy
  belongs_to :customer, required: false
  belongs_to :recruiter, required: false
  belongs_to :room
end
