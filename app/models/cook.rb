class Cook < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :reviews, dependent: :destroy

  
  with_options presence: true do
    validates :name, length: {maximum: 30}
  end
  validates :description, length: {maximum: 140}
  validates :point, length: {maximum: 50}
  validates :appearance,
            :numericality => {
              :only_interger => true,
              :greater_than_or_equal_to => 1,
              :less_than_or_equal_to => 5
            },
            allow_nil: true
end
