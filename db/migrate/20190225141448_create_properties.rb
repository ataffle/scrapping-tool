class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :ref
      t.string :city
      t.string :title
      t.string :price
      t.date :date
      t.string :url
      t.string :phone

      t.timestamps
    end
  end
end
