# -*- encoding: utf-8 -*-
class Category < ActiveRecord::Base
  acts_as_nested_set
  attr_accessible :name, :parent_id, :ctype, :position, :content
  attr_accessor :content, :page_content

  before_save :update_page_content

  class << self
    attr_accessor :ctypes
  end

  has_one :page
  has_one :articles

  self.ctypes = [['无页面', 'none'], ['页面', 'page'], ['列表', 'list']]

  validates :ctype, :inclusion => { :in => ['none', 'page', 'list'] }

  def content
    self.page.content if self.page
  end

  def content=(content)
    self.page_content = content
  end



  def update_page_content
    if self.ctype == "page"
      page = self.page || Page.new
      page.category = self
      page.content = self.page_content
      page.save!
    end
  end

  
end
