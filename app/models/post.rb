class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_one_attached :image

  validates :category_id, numericality: { other_than: 1 }
  validates :title, :text, :user_id, presence: true

  # def previous
  #   Post.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  # end

  # def next
  #   Post.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  # end
end
