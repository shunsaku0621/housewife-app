class Tag < ApplicationRecord
  has_many :post_tag_relations
  has_many :posts, through: :post_tag_relations

  # 一意性の制約はモデル単位で設ける必要がある
  validates :name, uniqueness: true

  # validates :name, presence: true
end
