class Getmoney < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category2
  belongs_to :user
end
