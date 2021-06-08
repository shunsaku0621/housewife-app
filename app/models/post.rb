class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  
  has_many :post_tag_relations
  has_many :tags, through: :post_tag_relations
  has_one_attached :image

  
  # with_options presence: true do
  #   validates :title
  #   validates :text
  # end

  # #ジャンルの選択が「--」の時は保存できないようにする
  # validates :genre_id, numericality: { other_than: 1 } 
end
