class AddCityToScraps < ActiveRecord::Migration[5.2]
  def change
    add_column :scraps, :city, :string
  end
end
