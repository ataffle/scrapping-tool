class CreateScraps < ActiveRecord::Migration[5.2]
  def change
    create_table :scraps do |t|
      t.string :url

      t.timestamps
    end
  end
end
