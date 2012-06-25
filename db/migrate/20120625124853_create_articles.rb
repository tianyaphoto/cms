class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.references :category
      t.text :content
      t.integer :clicked

      t.timestamps
    end
    add_index :articles, :category_id
  end
end
