class AddFileToPage < ActiveRecord::Migration
  def change
    add_column :pages, :file, :string
    add_column :pages, :file_download_text, :string
  end
end
