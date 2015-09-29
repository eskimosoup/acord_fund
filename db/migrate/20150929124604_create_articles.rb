class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :image
      t.text :summary, null: false
      t.text :content, null: false
      t.date :date, null: false
      t.boolean :display, default: true
      t.string :suggested_url, unique: true
      t.string :slug, unique: true

      t.timestamps null: false
    end
  end
end
