class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ニキビで悩んだ体験談' },
    { id: 3, name: '自分なりのニキビ治療法' },
    { id: 4, name: 'ニキビが減る習慣' },
    { id: 5, name: 'ニキビを減らしたいならやってはいけないこと' },
    { id: 6, name: 'ニキビができる食べ物' },
    { id: 7, name: 'ニキビのここが嫌' },
    { id: 8, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts
end
