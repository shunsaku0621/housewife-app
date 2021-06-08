class PostsTag
  include ActiveModel::Model
  attr_accessor :title, :text, :user_id, :name, :genre_id, :image


  with_options presence: true do
    validates :title
    validates :text
    # validates :name
    validates :user_id
  end

   #ジャンルの選択が「--」の時は保存できないようにする
   validates :genre_id, numericality: { other_than: 1 } 



  def save
    post = Post.create(title: title, text: text, user_id: user_id, genre_id: genre_id, image: image)
    # tag = Tag.create(name: name)
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    PostTagRelation.create(post_id: post.id, tag_id: tag.id)
  end
end