class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :category
      t.text :content

      t.timestamps
    end
    add_index :pages, :category_id
  end
end
