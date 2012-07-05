# -*- encoding: utf-8 -*-
module ApplicationHelper

  #<li  class="current"><img src="/assets/icon04.png"><a href="/"><%=category.name  %></a></li>
  def nav_child_li category
    #link = link_to  category.name,  category_url(category)
    link = link_to  category.name,  "/show/#{category.id}"
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
      link = link_to category.name, "/show/#{category.id}" ,:class => "current"
    else
      link = link_to category.name, "/show/#{category.id}"
    end
    content_tag "li", link
  end

  def sider
    #   list = ""
    #   all = Category.where("id != 1").all
    #   all.each do |obj|
    #     list << content_tag("li", raw("&nbsp;&nbsp;" * obj.depth + link_to(obj.name, edit_category_path(obj))))
    #   end
    #   content_tag("ul", raw(list))
    html = ""
    root = Category.first
    root.descendants.each do |obj|
      html += content_tag("li",raw("&nbsp;&nbsp;" * (obj.depth - 1) + link_to(obj.name, edit_category_path(obj))))
    end
    content_tag "ul", raw(html)
  end

end
