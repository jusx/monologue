class Monologue::PostCategory < ActiveRecord::Base
  belongs_to :post
  belongs_to :category

  attr_accessible :category_id
end