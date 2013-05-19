# categories should have :
# name 
# order - for re-ordering.

FactoryGirl.define do
  factory :category, class: Monologue::Category do
    name "development"
    order 0
  end
  
  factory :category2, class: Monologue::Category do
    name "life"
    order 1
  end
  
end