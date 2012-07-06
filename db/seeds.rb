# -*- encoding: utf-8 -*-

#init adminor
admin = User.create({
  :email => "admin@zgzcjt.com",
  :password => "123456"
  })

#init navigation
root = Category.create(:name => "筑诚集团", :ctype => 'none')

c1 = Category.create(:name => "集团首页", :parent_id => root.id, :ctype => 'none')
c2 = Category.create(:name => "筑诚建设", :parent_id => root.id, :ctype => 'none')
c3 = Category.create(:name => "筑诚投资", :parent_id => root.id, :ctype => 'none')
c4 = Category.create(:name => "筑诚能源", :parent_id => root.id, :ctype => 'none')
c5 = Category.create(:name => "筑诚文化", :parent_id => root.id, :ctype => 'none')


cc1 = Category.create(:name => "企业介绍", :parent_id => c1.id, :ctype => 'page', :position => 1)
cc2 = Category.create(:name => "企业宗旨", :parent_id => c1.id, :ctype => 'page', :position => 2)
cc3 = Category.create(:name => "企业目标", :parent_id => c1.id, :ctype => 'page', :position => 3)
cc4 = Category.create(:name => "核心理念", :parent_id => c1.id, :ctype => 'page', :position => 4)
cc5 = Category.create(:name => "管理思想", :parent_id => c1.id, :ctype => 'page', :position => 5)
cc6 = Category.create(:name => "集团新闻", :parent_id => c1.id, :ctype => 'list', :position => 6)
