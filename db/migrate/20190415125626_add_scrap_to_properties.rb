class AddScrapToProperties < ActiveRecord::Migration[5.2]
  def change
    add_reference :properties, :scrap, foreign_key: true
  end
end
