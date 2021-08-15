class Review < ApplicationRecord
  belongs_to :user
  belongs_to :cook

  validates :score, presence: true
end
