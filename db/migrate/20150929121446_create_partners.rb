class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.integer :position
      t.string :name, null: false
      t.string :image, null: false
      t.text :content
      t.string :website
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
