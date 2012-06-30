# -*- encoding: utf-8 -*-
class WelcomeController < ApplicationController

  before_filter  :init_navigation
  
  def index
    @category = Category.where("name = ?", "集团首页").first
    @current_c = @category
    @page = @current_c.page
    @category_child = @current_c.children
  end
  


end
