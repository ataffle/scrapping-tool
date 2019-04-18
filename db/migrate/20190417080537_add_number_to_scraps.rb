class AddNumberToScraps < ActiveRecord::Migration[5.2]
  def change
    add_column :scraps, :number, :integer
  end
end
