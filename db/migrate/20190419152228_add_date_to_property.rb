class AddDateToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :date, :date
  end
end
