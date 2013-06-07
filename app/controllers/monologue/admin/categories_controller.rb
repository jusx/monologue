class Monologue::Admin::CategoriesController < Monologue::Admin::BaseController
  
  def index
    @categories = Monologue::Category.all
  end
  
  
end