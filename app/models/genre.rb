class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'なんでも' },
    { id: 3, name: '相談' },
    { id: 4, name: 'ニュース' },
    { id: 5, name: 'エンタメ・芸能人' },
    { id: 6, name: 'ファション' },
    { id: 7, name: '美容・健康' },
    { id: 8, name: '趣味' },
    { id: 9, name: '旦那・子育て' },
    { id: 10, name: '料理・家事' },
    { id: 11, name: 'ダイエット' },
    { id: 12, name: 'その他' }
  ]


  include ActiveHash::Associations
  has_many :posts
 end