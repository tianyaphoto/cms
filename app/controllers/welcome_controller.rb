class WelcomeController < ApplicationController

  before_filter  :init_navigation
  
  def index
     @category_child = Category.find(2).children
    
  end

  private
  def init_navigation
    @categories = Category.root.children 
  end

end
