class Apply < ApplicationRecord
  belongs_to :customer
  belongs_to :volunteer
  validates :customer_id, presence: true
  validates :volunteer_id, presence: true
  validates  :customer_id, uniqueness: { scope: :volunteer_id}
end
