class Getmoney < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category2
  belongs_to :user


  with_options presence: true do
    validates :amount
    validates :start_time
  end
  validates :category2_id, numericality: { other_than: 1 }
end
