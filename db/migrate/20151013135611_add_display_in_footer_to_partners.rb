class AddDisplayInFooterToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :display_in_footer, :boolean
    rename_column :partners, :display, :display_on_partners_page
  end
end
