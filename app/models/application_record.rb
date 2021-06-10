class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def prev
    Post.where('id > ?', id).order('id ASC').first
  end

  def next
    Post.where('id < ?', id).order('id DESC').first
  end
end
