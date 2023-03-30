class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :introduction,          null: false
      t.integer :customer_id,   null: false
      t.integer :cosmetic_id,       null: false


      t.timestamps
    end
  end
end
