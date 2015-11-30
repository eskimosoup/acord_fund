class AddBiographyToTeamMember < ActiveRecord::Migration
  def change
    add_column :team_members, :biography, :text
  end
end
