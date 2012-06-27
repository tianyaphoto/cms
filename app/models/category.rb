# -*- encoding: utf-8 -*-
class Category < ActiveRecord::Base
  acts_as_nested_set
  attr_accessible :name, :parent_id, :ctype, :position, :content
  attr_accessor :content

  class << self
    attr_accessor :ctypes
  end

  has_one :page
  has_one :articles

  self.ctypes = [['无页面', 'none'], ['页面', 'page'], ['列表', 'list']]

  validates :ctype, :inclusion => { :in => ['none', 'page', 'list'] }


  #  def initialize
  #    if self.ctype == 'page'
  #      self.class_eval do
  #        has_one :page
  #      end
  #    elsif self.ctype == 'list'
  #      self.class_eval do
  #        has_one :articles
  #      end
  #    end
  #    super
  #  end


  def after_save
    
  end

  
end
