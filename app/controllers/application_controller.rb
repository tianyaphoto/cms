class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def init_navigation
    @categories = Category.root.children
  end

  def drop_breadcrumb
    @breadcrumbs ||= []
    items = @category.self_and_ancestors
    items.shift
    items.each do |item|
      crumb = %Q{<a href="/show/#{item.id}">#{item.name}</a>}.html_safe
      @breadcrumbs << crumb 
    end
  end

  private
  def after_sign_in_path_for(resource_or_scope)
    categories_path
  end  
end
