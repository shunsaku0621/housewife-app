class Income < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  
  with_options presence: true do
    validates :amount
    validates :start_time
  end
  validates :category_id, numericality: { other_than: 1 }


end
