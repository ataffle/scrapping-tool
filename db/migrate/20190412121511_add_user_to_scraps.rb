class AddUserToScraps < ActiveRecord::Migration[5.2]
  def change
    add_reference :scraps, :user, foreign_key: true
  end
end
