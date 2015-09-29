class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.integer :position
      t.string :name, null: false
      t.string :role, null: false
      t.text :contact_details
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
