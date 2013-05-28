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
  
end