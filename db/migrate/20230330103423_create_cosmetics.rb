class CreateCosmetics < ActiveRecord::Migration[6.1]
  def change
    create_table :cosmetics do |t|
      
      t.string :text,                   null: false
      t.integer:customer_id,            null: false

      t.timestamps
    end
  end
end
