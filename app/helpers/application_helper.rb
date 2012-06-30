module ApplicationHelper

  #<li  class="current"><img src="/assets/icon04.png"><a href="/"><%=category.name  %></a></li>
  def nav_child_li category
    link = link_to  category.name,  category_url(category)
    img = image_tag "icon04.png"
    if @current_c == category
      content_tag("li",  img + link, "class" => "current")
    else
      content_tag "li", img + link
    end
  end

  #<li><a class="current" href="http://localhost:3000/">集团首页</a></li>
  def nav_li category
    if((@current_c == category) || category.children.include?(@current_c))
      link = link_to category.name,  category_path(category) ,:class => "current"
    else
      link = link_to category.name, category_path(category)
    end
    content_tag "li", link
  end
  
end
