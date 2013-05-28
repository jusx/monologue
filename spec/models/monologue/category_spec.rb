require 'spec_helper'

describe Monologue::Category do
  before(:each) do
    @category= Factory(:category)
  end

  it "is valid with attributes from the factory mock" do
    @category.should be_valid
  end

  describe "validations" do
    it "should have unique names" do
       expect { Factory(:category) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should validate the presence of name" do
      expect { Factory(:category,name:nil) }.to raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "is not removeable when there are posts associated with it!" do
      post = Factory(:post)
      post.categories << @category
      post.should be_valid
      post.save
      
      post.reload.categories.should be_any
      @category.destroy.should_not raise_error(ActiveRecord::RecordInvalid)
      @category.is_removeable?.should be_false
    end
    

  end
  
end