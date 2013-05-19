# Category of a post.
class Monologue::Category < ActiveRecord::Base
  has_many :posts
  attr_accessible :name, :order
  validates :name, presence: true, uniqueness: true
  
  
  def is_removeable?
    return self.posts.empty?
  end
  
  def before_destroy
    if !is_removeable?
      errors.add(:posts, I18n.t("activerecord.errors.models.monologue/category.attributes.posts.not_empty_cannot_remove"))
    end  
  end
  
end