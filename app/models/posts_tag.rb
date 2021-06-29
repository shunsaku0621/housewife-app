class PostsTag
  include ActiveModel::Model
  attr_accessor :title, :text, :user_id, :name, :genre_id, :image


  with_options presence: true do
    validates :title
    validates :text
    validates :user_id
  end

   #ジャンルの選択が「--」の時は保存できないようにする
   validates :genre_id, numericality: { other_than: 1 } 

  # // postがすでに保存されているものか、新規のものかで、PUTとPATCHを分ける
  # delegate :persisted?, to: :post


  # def initialize(attributes = nil, post: Post.new)
  #   @post = post
  #   attributes ||= default_attributes
  #   super(attributes)
  # end
  

  def save(tag_list)
    post = Post.create(title: title, text: text, user_id: user_id, genre_id: genre_id, image: image)

    tag_list.each do |tag_name|
      tag = Tag.where(name: tag_name).first_or_initialize
      tag.save
      PostTagRelation.create(post_id: post.id, tag_id: tag.id)
    end


  end



  # def save(tag_list)
  #   ActiveRecord::Base.transaction do
  #     @post.update(title: title, image: image, text: text, genre_id: genre_id, user_id: user_id)

  # #     #// @carに紐付くタグがあれば、car_tagsテーブルの紐付くレコードを全て消去する
  #     @post.post_tag_relation.each do |tag|
  #       tag.delete
  #     end

  # #     #// tag_listのタグの数だけ、tagsテーブルと、car_tagsテーブルに保存する
  #     tag_list.each do |tag_name|
  #       tag = Tag.where(name: tag_name).first_or_initialize
  #       tag.save

  #       post_tag_relation = PostTagRelation.where(post_id: @post.id, tag_id: tag.id).first_or_initialize
  #       post_tag_relation.update(post_id: @post.id, tag_id: tag.id)
  #     end
  #   end
  # end

  # def to_model
  #   post
  # end

  # private

  # attr_reader :post

  # def default_attributes
  #   {
  #     title: post.title,
  #     image: post.image,
  #     text: post.text,
  #     genre_id: post.genre_id,
  #     name: post.tags.pluck(:name).join(',')
  #   }
  # end


end