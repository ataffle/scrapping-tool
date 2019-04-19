class RemoveDateFromProperty < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :date, :string
  end
end
