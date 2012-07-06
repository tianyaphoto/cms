# -*- encoding: utf-8 -*-
class WelcomeController < ApplicationController

  before_filter  :init_navigation
  
  def index
    @category = Category.where("name = ?", "集团首页").first
    redirect_to "/show/#{@category.id}"
    @current_c = @category
    @page = @current_c.page
    @category_child = @current_c.children
  end

  def show
    cat = Category.find_by_id(params[:id])
    if cat.ctype == 'none' && !cat.children.empty?
      @category = cat.children.first
    else
      @category = cat
    end
    @current_c = @category
    @category_child =  (@category && @category.depth == 1) ?  @current_c.children  : @current_c.parent.children
  end


end
