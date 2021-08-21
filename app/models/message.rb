class Message < ApplicationRecord
  belongs_to :customer, required: false
  belongs_to :recruiter, required: false
  belongs_to :room
end
