# categories should have :
# name 
# order - for re-ordering.

FactoryGirl.define do
  factory :category, class: Monologue::Category do
    name "development"

  end
  
  factory :category2, class: Monologue::Category do
    name "life"
  end
  
  factory :category_with_post, class: Monologue::Category, parent: :category do |cat|
    cat.after_create { |u| Factory(:post, category: u) }
  end
  
end