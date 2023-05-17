class AddStarToCosmetics < ActiveRecord::Migration[6.1]
  def change
    add_column :cosmetics, :star, :string
  end
end
