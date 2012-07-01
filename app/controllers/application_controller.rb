class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def init_navigation
    @categories = Category.root.children
    
  end

  private
  def after_sign_in_path_for(resource_or_scope)
    categories_path
  end  
end
