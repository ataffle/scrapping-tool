class ChangeColumn < ActiveRecord::Migration[5.2]
  def up
    change_column :scraps, :number, :bigint
  end
end
