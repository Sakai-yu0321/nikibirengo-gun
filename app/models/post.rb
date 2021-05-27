class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_one_attached :image

  validates :category_id, numericality: { other_than: 1 }
  validates :title, :text, :user_id, presence: true
end
