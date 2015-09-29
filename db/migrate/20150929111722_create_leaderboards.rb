class CreateLeaderboards < ActiveRecord::Migration
  def change
    create_table :leaderboards do |t|
      t.string :title, null: false
      t.string :area, null: false
      t.string :image, null: false
      t.string :link
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
