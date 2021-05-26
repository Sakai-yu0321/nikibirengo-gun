class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :title, :text, :user_id, presence: true
  validates :category_id, numericality: { other_than: 1 }

  belongs_to :user
end
