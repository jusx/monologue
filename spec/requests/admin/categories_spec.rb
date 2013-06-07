require 'spec_helper'
describe "categories" do
  
  context "manage categories" do 
    before(:each) do
      log_in
      visit new_admin_category_path
    end
    
    it "should show categories if any" do
      cat = Factory(:category)
      page.should have_content cat.name
      # Monologue::Category.all.any?.should be_true
    end
    
    it "should be able to create a category" do
      visit new_admin_category_path
      page.should have_content "Create"
      fill_in "Name", with:  "my name"
      click_button "Save"
      page.should have_content "Category created"
    end
    
    it "should be able to delete a category" do
      cat = Factory(:category)
      visit delete_admin_category_path(cat)
      page.should have_content "Category #{cat.name} removed successfully"
      
    end
    
    let!(:category_with_post) { Factory(:category_with_post) }
    it "should not be able to delete a category if there are posts assoicated" do
      visit admin_categories_path
      delete= I18n.t("monologue.admin.categories.index.delete")
      page.should_not have_link(delete, href: admin_category_path(category_with_post))
      
    end
    
  end
  
  context "creating a post as a logged in user" do
      let!(:category) { Factory(:category) }
      let!(:category2) { Factory(:category2) }
      
      before(:each) do
        log_in
        visit new_admin_post_path
        fill_in "Title", with:  "title"
        fill_in "Content", with:  "content"
        fill_in "Published at", with:  DateTime.now
      end

      it "should be able to save a post without specifying a category" do
        
        click_button "Save"
        page.should have_field :categories, with: ""
      end

      it "should save a post with multiple categories" do
        cats = "#{category.id}, #{category2.id}"
        fill_in "Categories", with: cats
        click_button "Save"
        page.should have_field :categories, with: cats
      end
      
      it "should save a post correctly with one category" do
        cat = "#{category.id}"
        fill_in "Categories", with: cat
        click_button "Save"
        page.should have_field :categories, with: cat
        
      end
  end
  
  context "NOT logged in user" do
    it "can NOT access category's admin" do
      visit admin_categories_path
      page.should have_content "You must first log in"
    end

    it "can NOT create new post" do
      visit new_admin_categories_path
      page.should have_content "You must first log in"
    end
    
    it "can NOT edit posts" do
      cat = Factory(:category)
      visit edit_admin_category_path(cat)
      page.should have_content "You must first log in"
    end
  end  
  

end