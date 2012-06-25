class WelcomeController < ApplicationController
  
  def index
    @nav_list = Category.root.children
  end

end
