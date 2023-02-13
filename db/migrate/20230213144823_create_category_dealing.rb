class CreateCategoryDealing < ActiveRecord::Migration[7.0]
  def change
    create_table :category_dealings do |t|
      t.references :category, null: false, foreign_key: true
      t.references :dealing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
