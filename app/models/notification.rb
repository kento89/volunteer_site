class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  belongs_to :room, optional: true
  belongs_to :message, optional: true
  belongs_to :customer, optional: true
  belongs_to :recruiter, optional: true
end
