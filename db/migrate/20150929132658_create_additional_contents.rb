class CreateAdditionalContents < ActiveRecord::Migration
  def change
    create_table :additional_contents do |t|
      t.string :area, null: false
      t.string :title
      t.text :content
      t.string :button_text
      t.string :button_link
      t.string :image
      t.string :video_url
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
