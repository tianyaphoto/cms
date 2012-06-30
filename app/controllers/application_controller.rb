class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def init_navigation
    @categories = Category.root.children
    
  end
end
