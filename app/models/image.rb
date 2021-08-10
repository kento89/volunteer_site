class Image < ApplicationRecord
  belongs_to :volunteer
  attachment :image
end
