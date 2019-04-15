class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    def change
      rename_column :scraps, :url, :scrap_url
    end
  end
end
