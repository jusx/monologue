class CreateCategories < ActiveRecord::Migration
  def change
    create_table :monologue_categories do |t|
      t.string :name
    end
 
    create_table :monologue_post_categories do |t|
      t.integer :post_id, :category_id
    end  
    
    add_index :monologue_post_categories, :post_id
    add_index :monologue_post_categories, :category_id
     
  end
end