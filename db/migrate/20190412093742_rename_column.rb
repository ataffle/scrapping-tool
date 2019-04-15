class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    def self.up
        rename_column :scraps, :url, :scrap_url
    end
  end
end
