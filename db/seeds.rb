# -*- encoding: utf-8 -*-
root = Category.create(:name => "筑诚集团")

c1 = Category.create(:name => "集团首页", :parent_id => root.id)
c2 = Category.create(:name => "筑诚建筑", :parent_id => root.id)
c3 = Category.create(:name => "筑诚投资", :parent_id => root.id)
c4 = Category.create(:name => "筑诚能源", :parent_id => root.id)
c5 = Category.create(:name => "筑诚文化", :parent_id => root.id)


cc1 = Category.create(:name => "企业介绍", :parent_id => c1.id)
cc2 = Category.create(:name => "企业宗旨", :parent_id => c1.id)
cc3 = Category.create(:name => "企业目标", :parent_id => c1.id)
cc4 = Category.create(:name => "核心理念", :parent_id => c1.id)
cc5 = Category.create(:name => "管理思想", :parent_id => c1.id)
cc6 = Category.create(:name => "集团新闻", :parent_id => c1.id)