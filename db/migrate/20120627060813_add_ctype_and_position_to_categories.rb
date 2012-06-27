class AddCtypeAndPositionToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :ctype, :string, :default => 'none', :limit => 10
    add_column :categories, :position, :integer, :default => 0
  end
end
