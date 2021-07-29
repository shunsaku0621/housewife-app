class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
     
       with_options presence: true do      
         validates :nickname
         validates :birth
         with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/} do
           validates :last_name
           validates :first_name 
         end
         with_options format: { with: /\A[ァ-ヶー－]+\z/} do
           validates :last_name_kana
           validates :first_name_kana
         end
        end
     
        has_many :posts
        has_many :cooks
        has_many :favorites, dependent: :destroy
        has_many :comments
        has_many :blogs
        has_many :likes, dependent: :destroy
        has_many :incomes
        has_many :getmoneys



        def favorite(cook)
          Favorite.create(user_id: id, cook_id: cook.id)
        end
      
        # 料理をお気に入り解除する
        def unfavorite(cook)
          Favorite.find_by(user_id: id, cook_id: cook.id).destroy
        end
      
        # 現在のユーザーがお気に入り登録してたらtrueを返す
        def favorite?(cook)
          !Favorite.find_by(user_id: id, cook_id: cook.id).nil?
        end


        def already_liked?(cook)
          self.likes.exists?(cook_id: cook.id)
        end


end
