class ChangeDateFormatInProperties < ActiveRecord::Migration[5.2]
  def change
    change_column :properties, :date, :string
  end
end
