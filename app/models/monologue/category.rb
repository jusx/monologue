# Category of a post.
class Monologue::Category < ActiveRecord::Base
  has_many :post_categories
  has_many :posts, through: :post_categories
  
  attr_accessible :name
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