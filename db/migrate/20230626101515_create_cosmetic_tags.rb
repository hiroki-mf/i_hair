class CreateCosmeticTags < ActiveRecord::Migration[6.1]
  def change
    create_table :cosmetic_tags do |t|
      t.references :cosmetic, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
